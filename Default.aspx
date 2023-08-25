<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta content="IE=edge" http-equiv="X-UA-Compatible" /> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta charset="utf-8" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />

    <title>Dr. Chandrakant Lahane | Best Haematologist in Pune, Maharashtra.</title>

    <meta name="description" content="" />
    <meta name="keywords" content="" />

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
     <style type="text/css">
        .drgallery{
            background:#ccc url("images/dr-image-3.jpg") no-repeat left center; background-size:contain; width:100%; height:550px;
        }
    </style>
   <link href="adminpanel/css/drClahane.css" rel="stylesheet" />
    
    
    <%--<script src="adminpanel/js/unslider.js"></script>--%>
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <link href="adminpanel/css/rating-stars.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link href="adminpanel/css/toastr.css" rel="stylesheet" />
    <script src="adminpanel/js/toastr.js"></script>
    <script src="js/jquery.backstretch.js"></script>

	<script type="text/javascript">
	    function TostTrigger(EventName, MsgText) {
	        // code to be executed
	        Command: toastr[EventName](MsgText)
	        toastr.options = {
	            "closeButton": true,
	            "debug": false,
	            "newestOnTop": false,
	            "progressBar": false,
	            "positionClass": "toast-top-full-width",
	            "preventDuplicates": false,
	            "onclick": null,
	            "showDuration": "300",
	            "hideDuration": "1000",
	            "timeOut": "5000",
	            "extendedTimeOut": "1000",
	            "showEasing": "swing",
	            "hideEasing": "linear",
	            "showMethod": "slideDown",
	            "hideMethod": "fadeOut"
	        }

	    }
	</script>

    <script type="text/javascript">
        function ValidateForm() {
            //alert("Review data called");
            let name = document.forms["rating-review"]["txtTestName"].value;
            if (name == "") {
                TostTrigger('warning', 'Please Enter Your Name');
                return false;
            }
            let email = document.forms["rating-review"]["txtTestEmail"].value;
            if (email == "") {
                TostTrigger('warning', 'Please Enter Email Address');
                return false;
            }
            let mobileno = document.forms["rating-review"]["txtTestMobNo"].value;
            if (mobileno == "") {
                TostTrigger('warning', 'Please Enter Mobile no');
                return false;
            }
            let review = document.forms["rating-review"]["txtTestReview"].value;
            if (review == "") {
                TostTrigger('warning', 'Please Enter Review');
                return false;
            }
            let starrating = document.forms["rating-review"]["rating"].value;
            if (starrating == "") {
                TostTrigger('warning', 'Select Star Rating');
                return false;
            }


            //set values to testimonials object
            var TestimonialsData = {};
            TestimonialsData.TestPerson = $('#txtTestName').val();
            TestimonialsData.TestEmail = $('#txtTestEmail').val();
            TestimonialsData.TestMobileNo = $('#txtTestMobNo').val();
            TestimonialsData.TestInfo = $('#txtTestReview').val();
            //TestimonialsData.TestRating = $('#star').val();



            $.ajax({
                type: "POST",
                url: "Default.aspx/SaveTestimonials",
                data: '{custinfo: ' + JSON.stringify(TestimonialsData) + '}',
                //alert(data);,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    //alert('Testimonials added Successfully!' + response.d);
                    TostTrigger('success', 'Testimonial Submited Successfully!');
                    document.getElementById('txtTestName').value = '';
                    document.getElementById('txtTestEmail').value = '';
                    document.getElementById('txtTestMobNo').value = '';
                    document.getElementById('txtTestReview').value = '';
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        }

   </script>
	<script type="text/javascript">
        function GetRating(rating) {
            //alert("function rating called");
	        alert(rating.value);
	        $.ajax({
	            type: "POST",
	            url: "Default.aspx/GetRating",
	            data: '{ratingValue: ' + rating.value + '}',
	            //alert(data);,
	            contentType: "application/json; charset=utf-8",
	            dataType: "json",
	            success: function (response) {
	                //alert('rating ' + response.d);
	            },
	            failure: function (response) {
	                alert(response.d);
	            }
	        });
	    }
	</script>
</head>
<body>
    <div class="absTopArrow">
        <a href="#bannerSp"><div class="topArrowIco"></div></a>
    </div>
    <!---Header Start-->
    <div id="header" class="width100">
        <div class="themeBgPrime">
            <div class="pad_5">
                <div class="col_1140">
                    <a href="tel:+919860470444" class="topCall">+91 9860470444</a>
                    <div class="socialBox">
                        <a href="#" target="_blank" class="topFb" title="Follow Us on facebook"></a>
                        <a href="#" target="_blank" class="topInsta" title="Follow Us on Instagram"></a>
                        <a href="#" target="_blank" class="topyouTube" title="Follow Us on youtube"></a>
                    </div>
                    <div class="float_clear"></div>
                </div>
            </div>
        </div>
        <div class="pad_TB_10">
            <div class="col_1140 posRelative">
                <a href="#bannerSp" title="Dr. Chandrakant Lahane Hematology Center " class="txtDecNone">
                    <img src="images/logo-hematology.png" alt="Dr. Chandrakant Lahane Hematologist'" class="logo" />
                    <div class="logoName">
                        <h2 class="semiBold regular clrBlack mrg_B_3">Dr. Chandrakant Lahane</h2>
                        <span class="themeClrSec fontRegular letter-sp-3 upperCase">MBBS, MD Medicine<br /> DNB Clinical Haematologist</span>
                    </div>
                </a>
                <a href="#appointment" class="btnAppointment semiBold upperCase small letter-sp-2">Book Appointment</a>
                <   div id="nav">
                    <div id="topNavPanel">
                        <div class="col_1140">
                            <ul id="topNav">
                                <a href="javascript:void(0)" class="closeBtn" onclick="closeNav()">&times;</a>
                                <!--<li><a href="#bannerSp">Home</a></li>-->
                                <li><a href="#about">About Us</a></li>
                                <li><a href="#serv">Services</a></li>
                                <!--<li><a href="#gallery">Gallery</a></li>-->
                                <li class="app"><a href="#appointment">Book Appointment</a></li>
                                <li><a href="#review">Testimonials</a></li>
                                <li><a href="#contact">Contact</a></li>
                            </ul>
                            <div class="float_clear"></div>
                            <div id="mobNav">
                                <div class="pad_30">
                                    <span class="tiny upperCase clrWhite letter-sp-3 mrg_B_15">Phone:</span>
                                    <a href="tel:+919860470444" class="medium clrWhite light txtDecNone">+91 9860470444</a>
                                    <span class="space30"></span>
                                    <span class="tiny upperCase clrWhite letter-sp-3 mrg_B_15">Email:</span>
                                    <a href="mailto:demo@gmail.com" class="clrWhite breakWord txtDecNone">chandrakantck&#46;15&#64;gmail&#46;com</a>
                                    <span class="space30"></span>
                                    <span class="tiny upperCase clrWhite letter-sp-3 mrg_B_15">Follow Us:</span>
                                    <a href="#" target="_blank" class="fb socIco" title="Follow us on facebook"></a>
                                    <a href="#" target="_blank" class="insta socIco" title="Follow us on instagram"></a>
                                    <a href="#" target="_blank" class="youTube socIco" title="Follow us on Youtube"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="float_clear"></div>
                    <a id="navBtn" onclick="openNav()"></a>
                </div>
            </div>
        </div>
    </div>
    <!---Header End-->
    <!--<img src="images/banner/banner-1.jpg" class="width100"/>-->
    <!-- Banner Starts -->
    <div class="bannerSpacer" id="bannerSp"></div>
    <div class="banner dis-tbl" data-aos=" fade-down" data-aos-easing="linear" data-aos-duration="1000">
        <div class="bannerOverlay tbl-cell">
            <div class="col_1140">
                <div class="txtCenter">
                    <div class="">
                        <span class=""></span>
                        <div class="">
                            <h1 class="typewrite semiBold xxlarge clrWhite mrg_B_5 upperCase" data-period="2000" data-type='[ "Hi, I am Dr. Chandrakant Lahane",  "Consultant Haematologist", "Haemato-Oncologist, Bone Marrow Trasplant Physician" ]'>
                                <span class="wrap"></span>
                            </h1>
                            <h2 class="semiBold semi-large clrWhite">
                                MBBS, MD Medicine, DNB Clinical Haematologist
                            </h2>
                        </div>
                    </div>
                    <div id="about"></div>
                </div>
                <div class="float_clear"></div>
            </div>
        </div>
    </div>
    <!-- Banner Ends -->
    <!-- About Us Starts -->
    <%--<div id="about1">
        <span class="space50"></span>
        <div class="col_1140 overflowHidden">
            <div class="col_800" data-aos="fade-right" data-aos-duration="1000">
                <div class="pad_30">
                    <h1 class="semiBold medium themeClrPrime mrg_B_5">Dr. Chandrakant Lahane</h1>
                    <span class="regular semiBold mrg_B_10">
                        MBBS, MD Medicine, DNB Clinical Haematologist
                        Consultant Haematologist, Haemato-Oncologist, Bone Marrow Trasplant Physician
                    </span>
                    <span class="space10"></span>
                    <p class="clrGrey line-ht-5 fontRegular small mrg_B_15">
                        Dr. Chandrakant Lahane is currently associated with Sahyadri Hospitals as - Haematologist, Haemato-Oncologist Bone Marrow Transplant physician
                        His area of practice includes all hematological disorders including both benign and malignant blood diseases.
                        Dr. Chandrakant Lahane has completed MBBS from SRTR Medical College Ambejogai, Post that he pursued his masters at Government Medical College, Aurangabad.
                        He completed his DNB Clinical Haematology from Deccan Sahyadri Super Specialty Hospital. He is extensively trained as independent consultant in Heamatology, His key skills include
                        <ul class="bulletlist clrGrey">
                            <li><span>&#x0203A;</span>Benign Hematology - Bleeding &amp; Thrombosis Disorders like Hemophilia, Von Willevrand Disease</li>
                            <li><span>&#x0203A;</span>Autologous &amp; Allogeneic Bone marrow transplant</li>
                            <li><span>&#x0203A;</span>Malignant Haematology-Leukemia, Myeloma , Lymphoma</li>
                            <li><span>&#x0203A;</span>Thrombotic disorders like DVT, PE</li>
                            <li><span class="mrg_B_5">&#x0203A;</span>Hemoglobiopathies like Sickle cell disease and Thalassemia</li>
                        </ul>
                        <span class="space5"></span>
                        <span class="clrGrey line-ht-5 fontRegular small">He has published many articles in Index journals</span>
                    </p>
                </div>
                <div id="serv"></div>
            </div>
            <span class="space80"></span>
            <div class="col_340_right" data-aos="fade-left" data-aos-duration="1000">
                <img src="images/dr-chandrakant-lahane.jpg" class="width100" />
            </div>

            <div class="float_clear"></div>
            <span class="space50"></span>
        </div>
    </div>--%>
    <div id="about1">
        <span class="space50"></span>
        <div class="col_1140 overflowHidden">
            <div class="col_1_2" data-aos="fade-right" data-aos-duration="1000">
                <div class="pad_15">
                    <h1 class="semiBold medium themeClrPrime mrg_B_5">Dr. Chandrakant Lahane</h1>
                    <span class="regular semiBold mrg_B_10">
                        MBBS, MD Medicine, DNB Clinical Haematologist
                        Consultant Haematologist, Haemato-Oncologist, Bone Marrow Trasplant Physician
                    </span>
                    <span class="space10"></span>
                    <p class="clrGrey line-ht-5 fontRegular small mrg_B_15">
                        Dr. Chandrakant Lahane is currently associated with Sahyadri Hospitals as - Haematologist, Haemato-Oncologist Bone Marrow Transplant physician
                        His area of practice includes all hematological disorders including both benign and malignant blood diseases.
                        Dr. Chandrakant Lahane has completed MBBS from SRTR Medical College Ambejogai, Post that he pursued his masters at Government Medical College, Aurangabad.
                        He completed his DNB Clinical Haematology from Deccan Sahyadri Super Specialty Hospital. He is extensively trained as independent consultant in Heamatology, His key skills include
                        <ul class="bulletlist clrGrey">
                            <li><span>&#x0203A;</span>Benign Hematology - Bleeding &amp; Thrombosis Disorders like Hemophilia, Von Willevrand Disease</li>
                            <li><span>&#x0203A;</span>Autologous &amp; Allogeneic Bone marrow transplant</li>
                            <li><span>&#x0203A;</span>Malignant Haematology-Leukemia, Myeloma , Lymphoma</li>
                            <li><span>&#x0203A;</span>Thrombotic disorders like DVT, PE</li>
                            <li><span class="mrg_B_5">&#x0203A;</span>Hemoglobiopathies like Sickle cell disease and Thalassemia</li>
                        </ul>
                        <span class="space5"></span>
                        <span class="clrGrey line-ht-5 fontRegular small">He has published many articles in Index journals</span>
                    </p>
                </div>
                <div id="serv"></div>
            </div>
           <%-- <span class="space80"></span>--%>
            
            <div class="col_1_2" data-aos="fade-left" data-aos-duration="1000">
                <div class="pad_15">
                    <div class="drgallery"></div>
                </div>
            </div>
            <div class="float_clear"></div>
            <span class="space50"></span>

        </div>
    </div>
    <!-- About Us End -->

    <!-- Services  Starts -->
    <div class="col_1140 overflowHidden">
        <div class="pad_LR_20">
            <h3 class="large clrBlack semiBold">Clinical Services</h3>
            <span class="shortLine themeBgQtr"></span>
            <span class="space10"></span>
        </div>
        <div class="col_1_3" data-aos="fade-right" data-aos-duration="1000">
            <div class="pad_15">
                <div class="servicebox">
                    <div class="pad_20">
                        <div class="serviceicon">
                            <img src="images/icons/blood-cancer%20copy.png" />
                        </div>
                        <span class="space80"></span>
                        <span class="space70"></span>

                        <!--<h2 class="semiBold semiMedium">Blood cancers</h2>-->
                        <!--<h2 class="semiBold semiMedium">Blood Cancers</h2>-->
                        <ul class="bulletlist">
                            <li><span>&#x000BB;</span>Anemia of Chronic Disease</li>
                            <li><span>&#x000BB;</span>Hemochromatosis</li>
                            <li><span>&#x000BB;</span>Iron Deficiency Anemia</li>
                            <li><span>&#x000BB;</span>Polycythemia Vera</li>
                            <li><span>&#x000BB;</span>benign and malignant blood diseases</li>
                            <li><span>&#x000BB;</span>Leukemias (AML, ALL, CML, CLL)</li>
                            <li><span>&#x000BB;</span>Lymphomas (both Hodgkin's &amp; Non Hodgkins)</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="col_1_3" data-aos="fade-up" data-aos-easing="linear" data-aos-duration="1000">
            <div class="pad_15">
                <div class="servicebox">
                    <div class="pad_20">
                        <div class="serviceicon">
                            <img src="images/icons/blood-disorder.png" />
                        </div>
                        <!--<h2 class="semiBold large">Title</h2>-->
                        <span class="space80"></span>
                        <span class="space70"></span>
                        <!--<h2 class="semiBold semiMedium">Blood cancers</h2>-->
                        <!--<h2 class="semiBold semiMedium">Blood Cancers</h2>-->
                        <ul class="bulletlist">
                            <li><span>&#x000BB;</span>Aplastic Anemia</li>
                            <li><span>&#x000BB;</span>Hypercoagulable Disorder</li>
                            <li><span>&#x000BB;</span>Leucocytosis</li>
                            <li><span>&#x000BB;</span>Sickle Cell Anemia</li>
                            <li><span>&#x000BB;</span>Thalassemia</li>
                            <li><span>&#x000BB;</span>Hemophilia and Thrombotic(DVT, PE)</li>
                            <li><span>&#x000BB;</span>Thrombocytopenias</li>
                            <li><span>&#x000BB;</span>Pancytopenia</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="col_1_3" data-aos="fade-left" data-aos-duration="1000">
            <div class="pad_15">
                <div class="servicebox">
                    <div class="pad_20">
                        <div class="serviceicon">
                            <img src="images/icons/hematology.png" />
                        </div>
                        <span class="space80"></span>
                        <span class="space70"></span>
                        <!--<h2 class="semiBold semiMedium">Blood cancers</h2>-->
                        <!--<h2 class="semiBold semiMedium">Blood Cancers</h2>-->
                        <ul class="bulletlist">
                            <li><span>&#x000BB;</span>Erythrocytosis</li>
                            <li><span>&#x000BB;</span>Immune Thrombocytopenic Purpura</li>
                            <li><span>&#x000BB;</span>Leucopenia</li>
                            <li><span>&#x000BB;</span>Thrombotic Thrombocytopenic Purpura</li>
                            <li><span>&#x000BB;</span>Autologous and Allogenic</li>
                            <li><span>&#x000BB;</span>Stem cell transplants (Bone marrow transplants)</li>
                            <li><span>&#x000BB;</span>Myelodysplastic syndromes and Plasma cell dyscrasias</li>
                            <li><span>&#x000BB;</span>Chronic Myeloproliferative neoplams(PRV, ET, PMF &amp; CML)</li>

                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <span class="space40"></span>
    <div class="float_clear"></div>
    <!-- Services  End -->

    <!-- Appointment Starts -->
    <div id="appointment"></div>
    <div class="bgApp">
        <span class="space50"></span>
        <div class="col_1140 conBoxShadow overflowHidden" data-aos="fade-up" data-aos-easing="linear" data-aos-duration="1000">
            <div class="width60 bgWhite" id="conForm">
                <div class="pad_30">
                    <form autocomplete="off">
                        <h3 class="large clrBlack semiBold mrg_B_10">Fix An Appointment</h3>
                        <span class="shortLine themeBgQtr"></span>
                        <span class="space10"></span>
                        <div class="inputBox w100">
                            <input type="text" id="txtName" class="conTxtBox userName w95" maxlength="50" required />
                            <span>Name :*</span>
                        </div>
                        <div class="inputBox w50 float_left">
                            <div class="app_r_padding">
                                <input type="text" id="txtEmail" class="conTxtBox conEmail w95" maxlength="50" required />
                                <span>Email Address :*</span>
                            </div>
                        </div>
                        <div class="inputBox w50 float_left">
                            <div class="app_r_padding1">
                                <input type="text" id="txtMobile" class="conTxtBox conMob w95" maxlength="10" required />
                                <span>Mobile No :*</span>
                            </div>
                        </div>
                        <div class="float_clear"></div>
                        <%--<div class="inputBox w50 float_left">
                            <div class="app_r_padding">
                                <input type="text" id="ddrServ" list="servname" class="conTxtBox appServ w95" required>
                                <datalist id="servname">
                                    <option value="Anemias">
                                    <option value="Thrombocytopenias">
                                    <option value=" Pancytopenia">
                                    <option value="Aplastic Anemia">
                                    <option value="Hemophilia">
                                    <option value="Thrombotic disorders">
                                    <option value="DVT">
                                    <option value="PE">
                                    <option value="Sickle cell disease">
                                    <option value="Thalassemia">
                                </datalist>
                                <span>Type Of Service :*</span>
                            </div>
                        </div>--%>
                        <div class="inputBox w50 float_left">
                            <div class="app_r_padding1">
                                <input type="text" id="txtDate" class="conTxtBox appDate w95" maxlength="10" required />
                                <span>Appointment Date :*</span>
                            </div>
                        </div>
                        <div class="float_clear"></div>
                        <div class="inputBox w100">
                            <textarea id="txtMsg" class="conTxtBox conDesc w95" cols="20" rows="2" required></textarea>
                            <span>Message :*</span>
                        </div>
                        <span class="space70"></span>
                        <span class="space5"></span>
                        <span class="space3"></span>
                        <input id="btnSubmit" type="button" value="Send" class="buttonForm upperCase semiBold letter-sp-2" onclick="submitForm()" />
                    </form>
                </div>
            </div>
            <div class="width40">
                <div class="conInfoBox" id="conInfo">
                    <div class="pad_30">
                        <h2 class="large clrWhite">Consultancy Visits</h2>
                        <h2 class="small clrWhite">At Sahyadri Hospital's branches</h2>
                        <span class="shortLine bgWhite"></span>
                        <span class="space3"></span>
                        <span class="clrWhite semiBold regular">Hadapsar:</span>
                        <!--<span class="space10"></span>-->
                        <span class="fontRegular regular line-ht-5 clrWhite">Tuesday &amp; Friday <span class="mrg_L_15 regular clrWhite">9am to 11am</span> </span>
                        <span class="fontRegular regular line-ht-5 clrWhite">Monday, Thursday, Saturday <span class="mrg_L_15 regular clrWhite">9am to 1pm</span> </span>
                        <span class="fontRegular regular line-ht-5 clrWhite">Wednesday <span class="mrg_L_15 regular clrWhite">No OPD</span> </span>
                        <span class="greyLine"></span>
                        <span class="clrWhite semiBold regular">Nagar Road Yerwada:</span><br />
                        <span class="fontRegular regular line-ht-5 clrWhite">Daily<span class="mrg_L_15 regular clrWhite">3pm to 5pm</span></span><br />
                        <span class="fontRegular regular line-ht-5 clrWhite">Wednesday <span class="mrg_L_15 regular clrWhite">No OPD</span> </span>
                        <span class="greyLine"></span>
                        <span class="clrWhite semiBold regular">Bibweadi:</span><br />
                        <span class="fontRegular regular line-ht-5 clrWhite">Tuesday &amp; Friday<span class="mrg_L_15 regular clrWhite">12pm to 2pm</span></span>
                        <span class="greyLine"></span>
                        <span class="clrWhite semiBold regular">Deccan:</span><br />
                        <span class="fontRegular regular line-ht-5 clrWhite">By Appointments Only</span>
                        <span class="greyLine"></span>
                        <span class="clrWhite semiBold regular">Ahmadnagar - Mac Care hospital:</span><br />
                        <span class="fontRegular regular line-ht-5 clrWhite">1st &amp; 3rd Wednesday every month</span>
                        <span class="greyLine"></span>
                        <span class="clrWhite semiBold regular">Baramati, Phaltan, Lonand:</span><br />
                        <span class="fontRegular regular line-ht-5 clrWhite">2nd Wednesday every month</span>
                        <span class="greyLine"></span>
                        <span class="clrWhite semiBold regular">Akluj, Indapur, Daund:</span><br />
                        <span class="fontRegular regular line-ht-5 clrWhite">4th Wednesday every month</span>
                        <!--<span class="space20"></span>-->
                    </div>
                </div>
                <div class="float_clear"></div>
            </div>
            <span class="space70"></span>
        </div>
        <span class="space50"></span>
    </div>
    <!-- Appointment Ends -->

    <!-- Review Starts -->
    <span class="space20"></span>
    <div class="col_1140 overflowHidden" id="review">
        <div class="col_1_2" data-aos="fade-right" data-aos-duration="1000">
            <div class="pad_30">
                <h2 class="large clrBlack semiBold mrg_B_10">Testimonials</h2>
                <span class="shortLine themeBgQtr "></span>
                <%=GetTestimonials() %>
                <%--<div class="bubble6">
                    <div class="bubble6-arrow"></div>
                    <div class="pad_15">
                        <img src="images/icons/1-star.png" />
                        <span class="space5"></span>
                        <span class="semiMedium bold">PALLAVI DHADAKE</span><br />
                        <span class="reviewdt themeClrPrime"> 15-07-2021</span>
                        <span class="space10"></span>
                        <p class="small line-ht-5 testQuote"> Dr. Lahane is a very humble man and he is very intelligent person and he also save's my life @cmc vellore lorem sperm </p>
                        <span class="space10"></span>
                    </div>
                </div>
                <span class="space30"></span>
                <div class="float_clear"></div>
                <div class="">
                    <div class="bubble6">
                        <div class="bubble6-arrow"></div>
                        <div class="pad_15">
                            <img src="images/icons/1-star.png" />
                            <span class="space5"></span>
                            <span class="semiMedium bold">PALLAVI DHADAKE</span><br />
                            <span class="reviewdt themeClrPrime"> 15-07-2021</span>
                            <span class="space10"></span>
                            <p class="small line-ht-5 testQuote"> Dr. Lahane is a very humble man and he is very intelligent person and he also save's my life @cmc vellore lorem sperm </p>
                            <span class="space10"></span>
                        </div>
                    </div>
                    <span class="space30"></span>
                </div>--%>
                <div id="contact"></div>
                <%--<div class="float_clear"></div>
                <div class="">
                    <div class="bubble6">
                        <div class="bubble6-arrow"></div>
                        <div class="pad_15">
                            <img src="images/icons/1-star.png" />
                            <span class="space5"></span>
                            <span class="semiMedium bold">PALLAVI DHADAKE</span><br />
                            <span class="reviewdt themeClrPrime"> 15-07-2021</span>
                            <span class="space10"></span>
                            <p class="small line-ht-5 testQuote"> Dr. Lahane is a very humble man and he is very intelligent person and he also save's my life @cmc vellore lorem sperm </p>
                            <span class="space10"></span>
                        </div>
                    </div>
                    <span class="space30"></span>
                </div>
                <div class="float_clear"></div>--%>
                <span class="space10"></span>
                <a href="testimonials" class="viewall txtDecNone">View all>></a>
                <span class="space10"></span>
            </div>
        </div>
        <div class="col_1_2" data-aos="fade-left" data-aos-duration="1000">
            <div class="pad_30">
                <h2 class="large clrBlack semiBold mrg_B_10 txtCenter">Rate Us</h2>
                <span class="shortLine themeBgQtr margin_auto"></span>
                <p class="small line-ht-5 txtCenter">Your email address and mobile will not be shared in this website.</p>
                <span class="space10"></span>
                <form id="rating-review" autocomplete="off">
                    <div class="inputBox w100">
                        <input type="text" id="txtTestName" class="conTxtBox userName w95" maxlength="50" required />
                        <span>Name :*</span>
                    </div>
                    <div class="inputBox w100">
                        <input type="text" id="txtTestEmail" class="conTxtBox conEmail w95" maxlength="50" required />
                        <span>Email :*</span>
                    </div>
                    <div class="inputBox w100">
                        <input type="text" id="txtTestMobNo" class="conTxtBox conMob w95" maxlength="10" required />
                        <span>Mobile No :*</span>
                    </div>

                   <!--star rating here-->
					<div class="stars" id="star">
						<input type="radio" name="rating" class="star-1" id="star-1" value="1" onclick="GetRating(this);" />
						<label class="star-1" for="star-1">1</label>
						<input type="radio" name="rating" class="star-2" id="star-2" value="2" onclick="GetRating(this);"/>
						<label class="star-2" for="star-2">2</label>
						<input type="radio" name="rating" class="star-3" id="star-3" value="3" onclick="GetRating(this);"/>
						<label class="star-3" for="star-3">3</label>
						<input type="radio" name="rating" class="star-4" id="star-4" value="4" onclick="GetRating(this);"/>
						<label class="star-4" for="star-4">4</label>
						<input type="radio" name="rating" class="star-5" id="star-5" value="5" onclick="GetRating(this);"/>
						<label class="star-5" for="star-5">5</label>
						<span></span>
					</div>

                    <div class="inputBox w100">
                        <textarea id="txtTestReview" class="conTxtBox conDesc w95" cols="20" rows="2" required></textarea>
                        <span>Review :*</span>
                    </div>

                    <div class="inputBox w100">
                        <input id="btnSubmitTestimonial" type="button" value="Submit" class="buttonForm upperCase semiBold letter-sp-2" onclick="ValidateForm();" />
                    </div>
                </form>

            </div>
        </div>
        <div class="float_clear"></div>
    </div>
    <!-- Review Ends -->

    <!-- Contact Starts -->
    <div class="col_1140 overflowHidden" id="review">
        <div class="col_1_2" data-aos="fade-right" data-aos-duration="1000">
            <div class="pad_15">
                <h2 class="large clrBlack semiBold mrg_B_10">Contct Info</h2>
                <span class="shortLine themeBgQtr "></span>
                <span class="semiBold regular">Need to discuss before treatment ?</span>
                <span class="space20"></span>
                <span class="home conIco">Sahyadri Super Speciality Hospital:-</span>
                <div class="pad_25">
                    <ul class="bulletlist">
                        <li><span>&#x000BB;</span>Hadapsar</li>
                        <li><span>&#x000BB;</span>Nagar Road SSH- Shastri Nagar Yerwada</li>
                        <li><span>&#x000BB;</span>Bibwewadi</li>
                        <li><span>&#x000BB;</span>Deccan</li>
                    </ul>
                </div>      
                <a href="tel:+91-9860470444" class="conCall conIco txtDecNone mrg_B_10">+91-9860470444</a>
                <span class="space20"></span>
                <a href="mailto:chandrakantck.15@gmail.com" class="conMail conIco breakWord txtDecNone">chandrakantck&#46;15&#64;gmail&#46;com</a>
            </div>
        </div>
        <div class="col_1_2" data-aos="fade-left" data-aos-duration="1000">
            <div class="pad_20">
                <span class="space50"></span>
                <span class="space30"></span>
                <!--<img src="images/dr-lahane-dentist-services.jpg" alt="" class="width100" />-->
                <img src="images/contact-us.svg" class="width100" />
            </div>
        </div>
    </div>
    <div id="map-canvas" data-aos="fade-right" data-aos-easing="linear" data-aos-duration="1000"></div>
    <!-- Contact Ends -->

        <!-- Footer Starts -->
        <div class="footer">
            <span class="space20"></span>
            <div class="col_1140 overflowHidden" data-aos="fade-left" data-aos-easing="linear" data-aos-duration="1000">
                <div class="col_1_4">
                    <div class="pad_15">
                        <h4 class="footerCaption clrWhite mrg_B_10 semiBold upperCase letter-sp-2">Navigation</h4>
                        <div class="fLine mrg_B_15"><span class="fAbsLine"></span></div>
                        <ul class="footerNav">
                            <li><a href="#bannerSp">Home</a></li>
                            <li><a href="#about">About Us</a></li>
                            <li><a href="#serv">Services</a></li>
                            <!--<li><a href="#gallery">Gallery</a></li>-->
                            <li><a href="#appointment">Book Appointment</a></li>
                            <li><a href="#map-canvas">Contact Us</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col_1_4">
                    <div class="pad_15">
                        <h4 class="footerCaption clrWhite mrg_B_10 semiBold upperCase letter-sp-2">Consultancy</h4>
                        <div class="fLine mrg_B_15"><span class="fAbsLine"></span></div>
                        <!--<h2 class="small clrWhite">At Sahyadri Hospital's branches</h2>-->
                        <span class="fontRegular small">Hadapsar: 9am to 11am Monday &amp; Friday</span>
                        <span class="fontRegular small">9am - 11pm Tue, Thurs, Sat</span>
                        <span class="fontRegular small">No OPD on Wednesday</span>
                        <span class="space5"></span>
                        <span class="fontRegular small">Nagar Road Yerwada SSH: Daily 3pm to 5pm Except Wednesday</span>
                        <span class="space5"></span>
                        <span class="fontRegular small">Deccan SSH: By Appointments Only</span>
                        <span class="space5"></span>
                        <span class="fontRegular small">Ahmadnagar-Mac Care hospital: 1st &amp; 3rd wednesday</span>
                        <span class="space5"></span>
                        <span class="fontRegular small">Baramati, Phaltan, Lonand: 2nd Wednesday every month</span>
                        <span class="space5"></span>
                        <span class="fontRegular small">Akluj, Indapur: 4th Wednesday every month</span>
                    </div>
                </div>
                <div class="col_1_4">
                    <div class="pad_15">
                        <h4 class="footerCaption clrWhite mrg_B_10 semiBold upperCase letter-sp-2">Get Social</h4>
                        <div class="fLine mrg_B_15"><span class="fAbsLine"></span></div>
                        <a href="#" target="_blank" class="foo_fb foo_socialIco" title="Follow us on facebook"></a>
                        <a href="#" target="_blank" class="foo_youTube foo_socialIco" title="Follow us on youtube"></a>
                        <a href="#" target="_blank" class="foo_insta foo_socialIco" title="Follow us on Instagram"></a>
                    </div>
                </div>
                <div class="col_1_4">
                    <div class="pad_15">
                        <h4 class="footerCaption clrWhite mrg_B_10 semiBold upperCase letter-sp-2">Contact Info</h4>
                        <div class="fLine mrg_B_15"><span class="fAbsLine"></span></div>
                        <span class="addr line-ht-5 small">Sahyadri Super Speciality Hospital, Hadapsar, Pune - 411028.</span>
                        <span class="space15"></span>
                        <a href="mailto:chandrakantck.15@gmail.com" class="email line-ht-5 small txtDecNone breakWord">chandrakantck&#46;15&#64;gmail&#46;com</a>
                        <span class="space15"></span>
                        <a href="tel:+99860470444" class="foo_call line-ht-5 small txtDecNone">+91-9860470444</a>
                    </div>
                </div>
                <div class="float_clear"></div>
            </div>
            <span class="space20"></span>
            <span class="footerLine"></span>
            <div class="col_1140 txtCenter">
                <div class="pad_15">
                    <span class="clrGrey mrg_B_5 small fontRegular">&copy; <%= currentYear %> | Dr. Chandrakant Lahane Haematologist , All Rights Reserved</span>
                    <span class="clrGrey small fontRegular">Website By <a href="http://www.intellect-systems.com" target="_blank" class="intellect" title="Website Design and Development Service By Intellect Systems">Intellect Systems</a></span>
                </div>
            </div>
        </div>
        <!-- Footer Ends -->

<%--  <script type="text/javascript">
      $(function () {
          $('.gallery').unslider({
              autoplay: false
          });
      })
	</script>--%>

    <script type="text/javascript">
        $(document).ready(function () {
            //alert("test");
            $(".drgallery").backstretch(
				["images/dr-image-3.jpg",
                 "images/dr-image-2.jpg",
                 "images/dr-image-1.jpg",
				 "images/dr-image-4.jpg"
				],
				{ duration: 3000, fade: 750 });
            //alert("test1");
        });
    </script>

    <script type="text/javascript">
        function openNav() {
            document.getElementById("topNavPanel").style.width = "320px";
            document.getElementById("navBtn").style.zIndex = "0";
        }

        function closeNav() {
            document.getElementById("topNavPanel").style.width = "0";
            document.getElementById("navBtn").style.zIndex = "5";
        }
    </script>

        <script type="text/javascript">
            $(window).scroll(function () {
                var topIcon = $('.topArrowIco'),
                    scroll = $(window).scrollTop();
                //alert("Msg");
                if (scroll >= 250) topIcon.addClass('fixedArrow');

                else topIcon.removeClass('fixedArrow');
                //alert("Msg");
            });

        </script>

        <script>
            AOS.init();
        </script>

        <script>
            var TxtType = function (el, toRotate, period) {
                this.toRotate = toRotate;
                this.el = el;
                this.loopNum = 0;
                this.period = parseInt(period, 10) || 2000;
                this.txt = '';
                this.tick();
                this.isDeleting = false;
            };

            TxtType.prototype.tick = function () {
                var i = this.loopNum % this.toRotate.length;
                var fullTxt = this.toRotate[i];

                if (this.isDeleting) {
                    this.txt = fullTxt.substring(0, this.txt.length - 1);
                } else {
                    this.txt = fullTxt.substring(0, this.txt.length + 1);
                }

                this.el.innerHTML = '<span class="wrap">' + this.txt + '</span>';

                var that = this;
                var delta = 200 - Math.random() * 100;

                if (this.isDeleting) { delta /= 2; }

                if (!this.isDeleting && this.txt === fullTxt) {
                    delta = this.period;
                    this.isDeleting = true;
                } else if (this.isDeleting && this.txt === '') {
                    this.isDeleting = false;
                    this.loopNum++;
                    delta = 500;
                }

                setTimeout(function () {
                    that.tick();
                }, delta);
            };

            window.onload = function () {
                var elements = document.getElementsByClassName('typewrite');
                for (var i = 0; i < elements.length; i++) {
                    var toRotate = elements[i].getAttribute('data-type');
                    var period = elements[i].getAttribute('data-period');
                    if (toRotate) {
                        new TxtType(elements[i], JSON.parse(toRotate), period);
                    }
                }
                // INJECT CSS
                var css = document.createElement("style");
                css.type = "text/css";
                css.innerHTML = ".typewrite > .wrap { border-right: 0.08em solid #fff; font-weight:600;}";
                document.body.appendChild(css);

                adjustHt();
            };
        </script>
        <script type="text/javascript"
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCvO0AHfg1cuND1KXbw3t5xZr5p4PVrEk4">
        </script>
        <script type="text/javascript">
            function initialize() {

                var myLatlng = new google.maps.LatLng(18.502996, 73.932215);

                var mapOptions = {
                    center: myLatlng,
                    zoom: 21, scrollwheel: false, draggable: true,
                };

                var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
                var autoqed = {
                    path: 'M95.35,50.645c0,13.98-11.389,25.322-25.438,25.322c-14.051,0-25.438-11.342-25.438-25.322   c0-13.984,11.389-25.322,25.438-25.322C83.964,25.322,95.35,36.66,95.35,50.645 M121.743,50.645C121.743,22.674,98.966,0,70.866,0   C42.768,0,19.989,22.674,19.989,50.645c0,12.298,4.408,23.574,11.733,32.345l39.188,56.283l39.761-57.104   c1.428-1.779,2.736-3.654,3.916-5.625l0.402-0.574h-0.066C119.253,68.516,121.743,59.874,121.743,50.645',
                    fillColor: '#d8162e',
                    fillOpacity: 1,
                    scale: 0.3
                };
                var marker = new google.maps.Marker({
                    position: myLatlng,
                    icon: autoqed,
                    map: map,
                    title: "Sahyadri Super Specialty Hospital, Hadapsar, Pune, Maharashtra",
                    animation: google.maps.Animation.DROP
                });
                //alert("test");
                marker.addListener('click', toggleBounce);
                function toggleBounce() {
                    if (marker.getAnimation() !== null) {
                        marker.setAnimation(null);
                    } else {
                        marker.setAnimation(google.maps.Animation.BOUNCE);
                    }
                }
            }
            google.maps.event.addDomListener(window, 'load', initialize);
        </script>

    

</body>
</html>
