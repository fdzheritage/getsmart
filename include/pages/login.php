
<?php
    if (!empty( $site_user) ) {
        echo '<a href="?p=' . $page. '&logout">Logout</a>';
    }
    else {

    
?>

<form action="?p=<?php echo $page ?>" method="post">
    <input type="hidden" name="login">
    <div>
        Username:
        <input type="text" name="username">

    </div>
    <div>
        Password:
        <input type="password" name="pass">
    </div>
    <input type="submit" value="Login">

</form>

<?php 
    }
?>