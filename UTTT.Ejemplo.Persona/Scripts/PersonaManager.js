<script>
	$(document).ready(function () {
		$.ajax({
			type: "POST",
			contentType: "application/json; charset=utf-8",
			url: "PersonaManager.aspx/FullDropDawnL",
			data: "{}",
			dataType: "json",
			success: function (result) {
				$("#ddlSexo").empty();
				$.each(result.data, function (key, value) {
					$("#ddlSexo").append($("<option></option>").val(value.IdS).html(value.ValueS));
				});
			},
			error: function ajaxError(result) {
				alert(result.status + ' : ' + result.statusText);
			}
		});
	});

</script>