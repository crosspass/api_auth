// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(() => {
  $('#client_list').on('change', 'input', (e) => {
    fetch(e.currentTarget.value).then((res) => {
      if (res.ok) {
        return res.json();
      }
      return null;
    })
    console.log('test');
  })
})
