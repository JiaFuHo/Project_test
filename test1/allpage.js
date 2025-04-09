// header
$("header").load("./header.html");
// footer
$("footer").load("./footer.html");

$.ajax({
    url: "./FAQ.json",
    dataType: "json",

    success: (data) => {
        let flush_html = ``;

        data.forEach((value) => {
            flush_html += `
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button id="accordion_btn_${value.I}" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#accordion_flush_${value.I}" aria-expanded="false" aria-controls="accordion_flush_${value.I}">
                    ${value.Q}
                    </button>
                </h2>
                <div id="accordion_flush_${value.I}" class="accordion-collapse collapse" data-bs-parent="#accordion_flush">
                    ${value.A}
                </div>
            </div>`;
            
            $("#accordion_flush").html(flush_html);
        });
    }
})