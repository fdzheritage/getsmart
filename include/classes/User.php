<?php


class User
{
    private $row;
    public function __contruct($row) {
        $this->row = $row;
    }

    public function toString() {
        return $this->row['username'];
    }

    // Check if user exists in database
    public static function isUser($username)
    {
        $pdo = $GLOBALS['pdo'];
        $query = $pdo->prepare('SELECT userId from user where username = ?');
        $query->execute([$username]);
        return !empty($query->rowcount());
    }


    // Create an new user if it does not exist
    public static function create($username, $pass)
    {
        $pdo = $GLOBALS['pdo'];
        // If user exists
        if (User::isUser($username)) {
                return array('status' => false, 'message' => "user <em>$username</em> already exists!");
                // If user does not exist 
            } else {
                // Generate password hash
                $passHash = password_hash($pass, PASSWORD_BCRYPT);
                $query = $pdo->prepare("INSERT INTO user (username, passHash) VALUES (?,?)");
                $query->execute([$username, $passHash]);
                if (!empty($query->rowcount())) {
                        return array('status' => true, 'message' => "user <em>$username</em> created!");
                    }
            }
    }

    // Login user with password
    public static function loginWithPassword($username, $pass)
    {
        $pdo = $GLOBALS['pdo'];
        $query = $pdo->prepare('SELECT * FROM user WHERE  userName = ?');
        $query->execute([$username]);
        // Does the user exists
        if (!empty($query->rowCount())) {
            $row = $query->fetch();
            // Verify passord
            if (password_verify($pass, $row['passHash'])) {

                $cookie = mt_rand(0, mt_getrandmax());
                $cookieHash = password_hash($cookie, PASSWORD_BCRYPT);
                $query = $pdo->prepare('UPDATE user SET cookieHash = ? WHERE userId = ?');
                $query->execute([$cookieHash, $row['userId']]);


                return array('status' => true, 'user' => $row, 'cookie' => $cookie);
            }
        }
        return array('status' => false, 'message' => 'Login invalid');
    }


    public static function loginWithCookies($username, $code)
    {
        $pdo = $GLOBALS['pdo'];
        $query = $pdo->prepare('SELECT * FROM user WHERE  userName = ?');
        $query->execute([$username]);
        // Does the user exists
        if (!empty($query->rowCount())) {
            $row = $query->fetch();
            // Verify passord
            if (password_verify($code, $row['cookieHash'])) {
                return array('status' => true, 'user' => $row);
            }
        }
        return array('status' => false, 'message' => 'Login invalid');
    }
}
