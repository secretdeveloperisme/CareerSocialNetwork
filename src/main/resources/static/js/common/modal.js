// Get the modal
let $modal = $("#myModal");

let $modalImg = $(".modal-content-img");
let $captionText = $(".modal-caption");
let $btnCloseModal = $(".btn-close-modal")

$btnCloseModal.on("click",function() {
  $modal.css("display","none");
})
function showModalImage({src, alt}){
  $modal.css("display","block");
  $modalImg.attr("src", src);
  $captionText.text(alt);
}