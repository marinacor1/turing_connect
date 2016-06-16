$(document).ready(function(){
  editName();
  editEmployer();
  editStreetAddress();
  editCity();
  editState();
  editEmail();
  editStatus();
});

function editName() {
    $(".user-detail-name").on('blur keydown', function(event){
      event.stopPropagation();
      if (event.type=== "blur" || event.keyCode === 13) {
        editContent(this, {name: $(this).text()})
      }
    })
}

function editEmployer() {
    $(".user-detail-employer").on('blur keydown', function(event){
      event.stopPropagation();
      if (event.type=== "blur" || event.keyCode === 13) {
      editContent(this, {current_employer: $(this).text()})
    }
    })
}

function editStreetAddress() {
    $(".user-detail-address").on('blur keydown', function(event){
      event.stopPropagation();
      if (event.type=== "blur" || event.keyCode === 13) {
      editContent(this, {street_address: $(this).text()})
    }
    })
}

function editCity() {
    $(".user-detail-city").on('blur keydown', function(event){
      event.stopPropagation();
      if (event.type=== "blur" || event.keyCode === 13) {
      editContent(this, {city: $(this).text()})
    }
    })
}

function editState() {
    $(".user-detail-state").on('blur keydown', function(event){
      if (event.type=== "blur" || event.keyCode === 13) {
      editContent(this, {state: $(this).text()})
    }
    })
}

function editEmail() {
    $('.user-detail-email').on('blur keydown', function(event){
      if (event.type=== "blur" || event.keyCode === 13) {
      editContent(this, {email: $(this).text()})
    }
    })
}

function editStatus() {
    $('.user-detail-status').on('blur keydown', function(event){
      if (event.type=== "blur" || event.keyCode === 13) {
      editContent(this, {status: $(this).text()})
    }
    })
}

function editContent(elementHTML, updatedContent ){
  $.ajax({
    type: "PATCH",
    url: "/api/v1/users/" + elementHTML.parentElement.id,
    data: {
      user: {
        name: updatedContent.name,
        current_employer: updatedContent.current_employer,
        street_address: updatedContent.street_address,
        city: updatedContent.city,
        state: updatedContent.state,
        email: updatedContent.email,
        status: updatedContent.status
      }
    },
    dataType: "json",
    success: function(datum) {
      $('.user-flash').removeClass('hidden')
      if (datum['response'] === 'successful') {
        $('.user-flash').text('Successfully updated!')
      } else {
        $('.user-flash').text('Update unsuccessful.')

      }
    }
  })
}
