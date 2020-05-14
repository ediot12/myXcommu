<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<!-- content-wrapper ends -->
		<!-- partial:partials/_footer.html -->
		<footer class="footer">
			<div class="container clearfix">
				<span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © 2020 <a href="/" target="_blank">ChangbaeKim</a>. All rights reserved.
				</span> <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted & made with <i class="mdi mdi-heart text-danger"></i>
				</span>
			</div>
		</footer>
		
		
		<!-- partial -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
</div>


<div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-modal="true" style="top : 25%;">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">신고하기</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-footer" style="padding: 15px 45px;">
				<button type="button"  onclick="commonReport('porno')" class="btn btn-danger" style="width: 100px; height: 50px; padding: 0;"><i class="fa fa-times-circle"></i>음란물신고</button>
				<button type="button"  onclick="commonReport('board')"  class="btn btn-danger" style="width: 100px; height: 50px; padding: 0;"><i class="fa fa-minus-circle"></i>게시물신고</button>
			</div>
		</div>
	</div>
</div>
<!-- container-scroller -->
<!-- plugins:js -->
<script src="/resources/assets/vendors/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page -->
<script src="/resources/assets/vendors/jquery-bar-rating/jquery.barrating.min.js"></script>
<script src="/resources/assets/vendors/datatables.net/jquery.dataTables.js"></script>
<script src="/resources/assets/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
<!-- End plugin js for this page -->
<!-- inject:js -->
<script src="/resources/assets/js/shared/misc.js"></script>
<!-- endinject -->
<!-- Custom js for this page -->
<script src="/resources/assets/js/demo_11/script.js"></script>
<script src="/resources/assets/js/shared/sweetalert.min.js"></script>
<script src="/resources/assets/vendors/jquery-toast-plugin/jquery.toast.min.js"></script>
<!-- End custom js for this page -->
</body>
</html>
