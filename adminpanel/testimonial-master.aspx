<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/MasterAdmin.master" AutoEventWireup="true" CodeFile="testimonial-master.aspx.cs" Inherits="adminpanel_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	 <script>
		$(document).ready(function () {
			$('[id$=gvTestimonials]').DataTable({
				columnDefs: [
					{ orderable: false, targets: [0, 1, 2, 3, 4, 5, 6, 7] }
				],
				order: [[0, 'desc']]
			});
		});
	 </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<h2 class="pgTitle">Testimonials Master</h2>
	<span class="space20"></span>
	<asp:GridView ID="gvTestimonials" runat="server" CssClass="table table-striped table-bordered table-hover" GridLines="None" 
				AutoGenerateColumns="false" OnRowDataBound="gvTestimonials_RowDataBound"   >
				 <HeaderStyle CssClass="thead-dark" />
				<RowStyle CssClass="" />
				<AlternatingRowStyle CssClass="alt" />
				<Columns>
					 <asp:BoundField DataField="TestId">
						<HeaderStyle CssClass="HideCol" />
						<ItemStyle  CssClass="HideCol"/>
					</asp:BoundField>
					 <asp:BoundField DataField="TestDate" HeaderText="Date">
						<ItemStyle Width="5%" />
					</asp:BoundField>
					  <asp:BoundField DataField="TestPerson" HeaderText="Name">
						<ItemStyle Width="20%" />
					</asp:BoundField>
					 <asp:BoundField DataField="TestMobileNo" HeaderText="Mobile No">
						<ItemStyle Width="10%" />
					</asp:BoundField>
					 <asp:BoundField DataField="TestEmail" HeaderText="Email">
						<ItemStyle Width="10%" />
					</asp:BoundField>
					   <asp:BoundField DataField="TestRating" HeaderText="Rating">
						<ItemStyle Width="5%" />
					</asp:BoundField>
						<asp:templatefield headertext="Status">
						<itemstyle width="5%" />
						<itemtemplate>
							<asp:literal id="litstatus" runat="server"></asp:literal>
						</itemtemplate>
					</asp:templatefield>   

					<asp:TemplateField HeaderText="Views">
						<ItemStyle Width="5%" />
						<ItemTemplate>
							<asp:Literal ID="litAnch" runat="server"></asp:Literal>
						</ItemTemplate>
					</asp:TemplateField>   
					
				</Columns>
				<EmptyDataTemplate>
					<span class="warning">Its Empty Here... :(</span>
				</EmptyDataTemplate>
				<PagerStyle CssClass="" />
			</asp:GridView>
</asp:Content>

