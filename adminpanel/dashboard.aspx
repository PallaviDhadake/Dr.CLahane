<%@ Page Title="Dashboard | Admin Control Panel" Language="C#" MasterPageFile="~/adminpanel/MasterAdmin.master" AutoEventWireup="true" CodeFile="dashboard.aspx.cs" Inherits="adminpanel_dashboard" %>

<%@ MasterType VirtualPath="~/adminpanel/MasterAdmin.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2 class="pgTitle">Dashboard</h2>
    <span class="space15"></span>
    <%--Dashboard card boxes start--%>
    <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="row">
            <div class="col-lg-3 col-6">
                <!-- small box -->
                <a href="testimonial-master.aspx">
                    <div class="small-box bg-info">
                    <div class="inner">
                        <h3><%= arrCounts[0] %></h3>

                        <p>Total Testimonials </p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-bag"></i>
                    </div>
                    <span class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></span>
                </div>
                </a>
            </div>
            <!-- ./col -->
        </div>
    </div>
    <%--  Dashboard cards end--%>
</asp:Content>

