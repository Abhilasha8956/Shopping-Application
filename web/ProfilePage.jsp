<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Profile Details</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" type="text/css" media="screen" href="bootstrap-5.0.0-beta1-dist/css/bootstrap.css" />
        <script src="bootstrap-5.0.0-beta1-dist/js/bootstrap.js"></script>
    </head>
    <body style="background-image: url(image.jpg); height: inherit">
        <div>
            <div class="container-fluid" style="height: fit-content; background-color: rgba(0, 0, 0, 0.2)">
                <div class="row h-100">
                    <div class="col-lg-2 col-md-6 col-sm-12 h-100 d-flex align-item-center mt-2 ml-2">
                        <a href="HomePage.html" class="ml-2"><img src="download.jpeg" class="mx-auto" style="height: 60px" /></a>
                    </div>
                    <div class="col-lg-8 col-md-6 col-sm-12 h-100 d-flex align-item-center">
                        <ul class="text-white list-inline m-0 mx-auto" style="padding: 10px">
                            <li class="list-inline-item h5 text-decoration-underline">Home</li>
                            <li class="list-inline-item h5">Contact US</li>
                            <li class="list-inline-item h5">Help</li>
                        </ul>
                    </div>
                    <div class="col-lg-2 col-md-12 col-sm-12 h-100">
                        <a class="btn btn-light border border-danger rounded form-control link-dark"  href="index.html"><b>Logout</b></a>
                    </div>
                </div>    
            </div>
            <div class="mycontainer" style="align-items: center;">
                <div class="box m-5 p-5" style="height: fit-content;
                width: 500px;
                background-color: rgba(0, 0, 0, 0.2) ;
                color: white;
                margin: 0 auto; ">
                    <form method="Post" action="">
                    <h3>User Id:</h3>
                    <input type="text" class="form-control w-75 m-2" value="" disabled="">
                    
                    <h3>Full Name:</h3>
                    <input type="text" class="form-control w-75 m-2" value="" disabled="">
                    
                    <h3>Email ID:</h3>
                    <input type="text" class="form-control w-75 m-2" value="" disabled="">
                    
                    <h3>Mobile Number:</h3>
                    <input type="text" class="form-control w-75 m-2" value="" disabled="">
                    
                    <input type="submit" class="form-control mt-5 mb-5" Value="Update Profile">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
