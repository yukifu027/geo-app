$(function(){
  function addGuide(guide) {
    let html = `
      <div class="chat-group-user clearfix">
        <a href= "/guides/${guide.id}", class="chat-group-user__name"> ${guide.title} </a>
      </div>
    `;
    $("#guide-search-result").append(html);
  }

  function addNoGuide() {
    let html = `
      <div class="chat-group-user clearfix">
        <p class="chat-group-user__name">ガイドが見つかりません</p>
      </div>
    `;
    $("#guide-search-result").append(html);
  }

  $('.search-form').on("keyup", function(){
    let input = $('.search-form').val();
    $.ajax({
      type: "GET",
      url: "/",
      data: { keyword: input },
      dataType: "json"
    })
      .done(function(guides_key) {
        $("#guide-search-result").empty();

        if (guides_key.length !== 0) {
          guides_key.forEach(function(guide) {
            addGuide(guide);
          });
        } else if (input.length == 0) {
          return false;
        } else {
          addNoGuide();
        }
      })
      .fail(function() {
        alert("通信エラーです。ガイドが表示できません。");
      });
  })
});