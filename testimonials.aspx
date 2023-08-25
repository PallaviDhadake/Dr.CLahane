<%@ Page Language="C#" AutoEventWireup="true" CodeFile="testimonials.aspx.cs" Inherits="testimonials" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta content="IE=edge" http-equiv="X-UA-Compatible" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<meta charset="utf-8" />
	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />

    <title>Dr. Chandrakant Lahane | Best Haematologist in Pune, Maharashtra.</title>
    <meta name="description" content="" />
	<meta name="keywords" content="" />

	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />

    <link href="adminpanel/css/drClahane.css" rel="stylesheet" />
	<script src="js/jquery-2.2.4.min.js"></script>
	<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
	<link href="css/rating-stars.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="themeBgPrime">
			<div class="pad_10">
				<div class="col_1140">
					<h2 class="txtCenter medium clrWhite">Dr. Chandrakant Lahane</h2>
					<span class="space10"></span>
					<h3 class="txtCenter semiMedium clrWhite">MBBS, MD Medicine, DNB Clinical Haematologist</h3>
					<%--<a href="tel:+919987290193" class="topCall">+91 9987290193</a>--%>
					<%--<div class="socialBox">
						<a href="#" target="_blank" class="topFb" title="Follow Us on facebook"></a>
						<a href="#" target="_blank" class="topInsta" title="Follow Us on Instagram"></a>
						<a href="#" target="_blank" class="topyouTube" title="Follow Us on youtube"></a>
					</div>--%>
					<div class="float_clear"></div>
				</div>
			</div>
		</div>
		<span class="space20"></span>
	<%-- Testimonials start --%>
		<div id="testimonials"></div>
		<div class="col_1140">
			<div class="">
			<div class="pad_15">
				<h2 class="large clrBlack semiBold mrg_B_10">Customer Testimonials</h2>
				<span class="shortLine themeBgPrime "></span>
				<%= GetTestimonials() %>
				<a href="default" class="viewall txtDecNone"><< Back to Home Page</a>
				</div>
			</div>
		</div>
    </form>
</body>
</html>
