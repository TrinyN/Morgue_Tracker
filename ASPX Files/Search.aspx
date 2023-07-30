﻿<%@ Page Title="Search" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="MorgueTracker3.Search" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <! TODO 
    implement HR for release info
    make sure update and release buttons render conditionally properly
    make sure any employee id thing gets slashes removed
    do error checks for empty patient name and empty patient name for update (half done i think)
    auto scroll down when release is pressed?
    figure out why search changes the navbar and the footer
    >
    <main>
        <section class="row justify-content-center" aria-labelledby="searchPatientTitle">
            <div class="col-lg-10 ">
                <div class="container">

                    <div class="row d-flex  flex-wrap justify-content-center ">
                        <div class="col-md-10">

                            <div class="form-group row mt-5 mb-3">
                                <div class="col-md-9 text-start">
                                    <asp:TextBox ID="txtPatientID" runat="server" class="form-control form-control-lg justify-content-center shadow-none" Placeholder="Scan Patient ID"></asp:TextBox>
                                </div>
                                <div class="col-md-3 text-end ">
                                    <asp:Button ID="btnSearch" class="btn-media btn btn-primary btn-lg col-md-12" runat="server" Text="Search" OnClick="Search_Click"></asp:Button>
                                </div>
                            </div>

                            <asp:Panel ID="hrResult" runat="server" CssClass="horizontal-line" Visible="true"></asp:Panel>

                            <div class="row">
                                <div class="col text-start mt-2">
                                    <div class="form-group">
                                        <asp:Label ID="lblPatientName" CssClass="label" runat="server">Patient Name:</asp:Label>
                                        <asp:TextBox ID="txtPatientName" class="form-control form-control-lg mb-4 shadow-none" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="lblCreatedDate" CssClass="label" runat="server">Date Added:</asp:Label>
                                        <asp:Label ID="pCreatedDate" class="form-control form-control-lg mb-4 shadow-none" runat="server"></asp:Label>
                                    </div>

                                </div>
                                <div class=" col text-start mt-2">
                                    <div class="form-group">
                                        <asp:Label ID="lblEmployeeID" CssClass="label" runat="server">Employee ID:</asp:Label>
                                        <asp:TextBox ID="txtEmployeeID" class="form-control form-control-lg mb-4 shadow-none" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="lblEmployeeName" CssClass="label" runat="server">Employee Name:</asp:Label>
                                        <asp:TextBox ID="txtEmployeeName" class="form-control form-control-lg mb-4 shadow-none" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row form-group justify-content-center ">
                                <asp:Label ID="lblLocationInMorgue" runat="server" class="label text-start" Style="padding-left: 13px">Location In Morgue:</asp:Label>
                                <div class="col-md-6 ">
                                    <div class="input-group">
                                        <asp:DropDownList ID="ddlLocationInMorgue" Style="color: #808080" runat="server" class="form-control form-control-lg justify-content-center shadow-none ">
                                            <asp:ListItem Enabled="true" Text="Select Location" Value="-1"></asp:ListItem>
                                            <asp:ListItem Value="Walk-In Left" Text="Walk-In Left"></asp:ListItem>
                                            <asp:ListItem Value="Walk-In Right" Text="Walk-In Right"></asp:ListItem>
                                            <asp:ListItem Value="Walk-In Middle" Text="Walk-In Middle"></asp:ListItem>
                                            <asp:ListItem Value="Walk-In Top Shelf" Text="Walk-In Top Shelf"></asp:ListItem>
                                            <asp:ListItem Value="Walk-In Bottom Shelf" Text="Walk-In Bottom Shelf"></asp:ListItem>
                                            <asp:ListItem Value="Walk-In Bassinet" Text="Walk-In Bassinet"></asp:ListItem>
                                            <asp:ListItem Value="Stand-Up Top" Text="Stand-Up Top"></asp:ListItem>
                                            <asp:ListItem Value="Stand-Up Middle" Text="Stand-Up Middle"></asp:ListItem>
                                            <asp:ListItem Value="Stand-Up Bottom" Text="Stand-Up Bottom"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="d-flex justify-content-between">
                                        <asp:Button ID="btnUpdate" CssClass="btn-media btn btn-primary btn-lg flex-fill me-3" runat="server" Text="Update" OnClick="Update_Click" />
                                        <asp:Button ID="btnRelease" CssClass="btn-media btn btn-primary btn-lg flex-fill ms-3" runat="server" Text="Release" OnClick="Release_Click" />
                                    </div>
                                </div>
                            </div>
                            <asp:Panel runat="server" ID="hrLine" CssClass=" hr-line mb-4 mt-5"></asp:Panel>
                            <div class="row">
                                <div class="col text-start">
                                    <div class="form-group">
                                        <asp:Label ID="lblFuneralHome" CssClass="label" runat="server">Funeral Home:</asp:Label>
                                        <asp:TextBox ID="txtFuneralHome" class="form-control form-control-lg mb-4 shadow-none" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="lblFuneralHomeEmployee" CssClass="label" runat="server">Funeral Employee:</asp:Label>
                                        <asp:TextBox ID="txtFuneralHomeEmployee" class="form-control form-control-lg mb-5 shadow-none" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col text-start">
                                    <div class="form-group">
                                        <asp:Label ID="lblOutEmployeeID" CssClass="label" runat="server">Employee ID:</asp:Label>
                                        <asp:TextBox ID="txtOutEmployeeID" class="form-control form-control-lg mb-4 shadow-none" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="lblOutEmployeeName" CssClass="label" runat="server">Employee Name: </asp:Label>
                                        <asp:TextBox ID="txtOutEmployeeName" class="form-control form-control-lg mb-5 shadow-none" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row justify-content-center">
                                <div class="col text-end">
                                    <asp:Button ID="btnSubmit" runat="server" Text="Upload" class="btn-media-lg btn btn-primary btn-lg col-md-3 mb-5" data-bs-toggle="modal" data-bs-target="#confirmationModal" OnClientClick="return false;"></asp:Button>
                                </div>
                            </div>
                            <div id="confirmationModal" class="modal fade" tabindex="-1" role="dialog">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Patient Release Confirmation</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="justify-content-lg-start d-flex">
                                                <asp:Label ID="lblConfirmationMessage" runat="server" Style="font: 600;" Text="" CssClass="mt-2 mb-4 justify-content-end" />
                                            </div>
                                            <div class="d-flex justify-content-end">
                                                <button type="button" class="btn btn-secondary me-2" data-bs-dismiss="modal">Return</button>
                                                <asp:Button ID="btnSubmitConfirm" CssClass="btn btn-primary" OnClick="Submit_Click" runat="server" Text="Yes" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <asp:Label ID="lblSuccessStatus" runat="server" class="form-control form-control-lg mb-5 col-md-3 p-5"></asp:Label>
                        </div>

                    </div>

                </div>
            </div>

        </section>
    </main>
    <script>
        function showConfirmationModal() {
            var funeralHome = document.getElementById('<%= txtFuneralHome.ClientID %>').value;
            var patientName = document.getElementById('<%= txtPatientName.ClientID %>').value;

            var confirmationMessage = "Are you certain you wish to release <strong>" + patientName + "</strong> to <strong>" + funeralHome + "</strong>?";

            document.getElementById('<%= lblConfirmationMessage.ClientID %>').innerHTML = confirmationMessage;

            $('#confirmationModal').modal('show');
        }

        // Sets the upload button to trigger modal
        $(document).ready(function () {
            $('#<%= btnSubmit.ClientID %>').click(function () {
                showConfirmationModal();
            });
        });
</script>


</asp:Content>
