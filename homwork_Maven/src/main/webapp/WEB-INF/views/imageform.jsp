 <%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<script type="text/javascript">
	$(function() {
		var imgArea = $("#imgArea");
		var pattern = '<img src="imageService?image=%v"/>';
		$("[name='image']").on("change", function() {
			var filename = $(this).val();
			imgArea.append(pattern.replace("%v", filename));
			
		})
		
	});
</script>
	<form name="imgForm" action="imageService" method="get">
		<select name="image">
			<%= request.getAttribute("optionsAttr") %>
		</select>
	</form>
<div id="imgArea">
	<%=request.getAttribute("imgTags") %>
</div>

<!-- <!-- <script type="text/javascript"> --> 
	
<!-- // 	function changeHandler(event) { -->
<!-- // // 		document.imgForm.submit(); -->
<!-- // 		var filename = event.target.value; -->
<!-- // 		var pattern = '<img src="imageService?image=%v"/>'; -->
<!-- // 		imgArea.innerHTML = pattern.replace("%v",filename); -->
		
<!-- // 	} -->
<!-- </script> -->
