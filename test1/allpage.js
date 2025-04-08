// header
$("header").load("./header.html");
// footer
$("footer").load("./footer.html");

$.ajax({
    url: "./FAQ.json",
    dataType: "json",

    success: (data) => {
        data.forEach((value) => {
            $("#accordion_btn_" + value.I).html(value.Q);
            $("#accordion_flush_" + value.I).html(value.A);
        });
    }
})