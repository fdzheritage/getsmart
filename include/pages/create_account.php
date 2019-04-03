<?php 

    // If the form was submited and contains the information we need
    if ( isset($_POST['create']) && 
         isset($_POST['username']) && 
         isset($_POST['pass'])  )
    {
        $result = User::create($_POST['username'],$_POST['pass'] );
        echo $result['message'];
    } else {
?>
<form action="?p=create_account" method="post">
    <input type="hidden" name="create">
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
