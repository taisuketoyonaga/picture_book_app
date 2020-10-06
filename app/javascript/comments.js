function comment(){
  const submit = document.getElementById('submit_btn');
  submit.addEventListener('click',(e)=>{
    const contentId = document.getElementById("comment_id")
    const contentDataId = contentId.getAttribute("data-id")
    const formData = new FormData(document.getElementById("form"))
    const XHR = new XMLHttpRequest();
    XHR.open('POST',`/contents/${contentDataId}/comments`,true); 
    XHR.responseType = "json" ;
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status !=200){
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const item = XHR.response.post ;
      const user = document.getElementById("comment_form")
      const userName = user.getAttribute("name")
      const list = document.getElementById("list");
      const formText = document.getElementById('comment')
      console.log(item)
      const HTML = `
      <div class = "comment_content" >
      <div class = comment_wrapper>
        <div class = "comment_user">
         ${userName}さん：
        </div>
        <div class = "comment">
         ${item.comment}
        </div>
      </div>
   </div>`;
      list.insertAdjacentHTML("afterend",HTML);
      formText.value = "";
    };
    e.preventDefault();

  });
}  
window.addEventListener('load',comment)

