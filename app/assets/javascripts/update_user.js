$(document).ready(function(){
  editName();
  editEmployer();
});

function editName() {
  $(".user-dashboard-info").on('click', '.user-detail-name', function(){
    $(this).attr('contentEditable', 'true');
    $(this).on('blur keydown', function(event){
      if (event.type=== "blur" || event.keyCode === 13) {
      editContent(this, {name: $(this).text()})
    }
    })
  })
}

function editEmployer() {
  $(".user-dashboard-info").on('click', '.user-detail-employer', function(){
    $(this).attr('contentEditable', 'true');
    $(this).on('blur keydown', function(event){
      if (event.type=== "blur" || event.keyCode === 13) {
      editContent(this, {current_employer: $(this).text()})
    }
    })
  })
}

function editContent(elementHTML, updatedContent ){
  $.ajax({
    type: "PATCH",
    url: "/api/v1/users/" + elementHTML.parentElement.id,
    data: {
      user: {
        name: updatedContent.name,
        current_employer: updatedContent.current_employer
      }
    },
    dataType: "json",
    success: function(datum) {
      console.log("Update successful!")
    }
  })
}
