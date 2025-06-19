$("#Qbtn_search1").on("click", () => {
    if ($("#Qbox_search").val() !== "") { $("#box_search").val($("#Qbox_search").val()) }

    $("#btn_submit1").trigger("click")
})

$("#Qbtn_search3").on("click", () => {
    if ($("#Qbox_search_year1").val() !== "") { $("#box_search_year1").val($("#Qbox_search_year1").val())}
    if ($("#Qbox_search_year2").val() !== "") { $("#box_search_year2").val($("#Qbox_search_year2").val())}

    $("#btn_submit2").trigger("click")
})

$("#Qbtn_search2").on("click", () => {
    $("#box_query2").removeClass("d-none")
    $("#box_query1").addClass("d-none")
})

$("#Qbtn_search4").on("click", () => {
    $("#box_query1").removeClass("d-none")
    $("#box_query2").addClass("d-none")
})


$(".Qbtn_hot").on("click", (e) => {
    let x = $(e.currentTarget).text();

    if ($("#box_query2").hasClass("d-none")) {
        $("#Qbox_search").val(x)
        $("#Qbtn_search1").trigger("click")
    }
    else if ($("#box_query1").hasClass("d-none")) {
        $("#Qbox_search_type").val(x)
        $("#Qbtn_search3").trigger("click")
    }
})