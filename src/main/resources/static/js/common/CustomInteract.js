
function addResizeAndDragForElement(element,editor){
  interact(element)
      .resizable({
        edges: { top: true, left: true, bottom: true, right: true },
        listeners: {
          move: function (event) {
            editor.enable(false)
            let { x, y } = event.target.dataset

            x = (parseFloat(x) || 0) + event.deltaRect.left
            y = (parseFloat(y) || 0) + event.deltaRect.top

            Object.assign(event.target.style, {
              width: `${event.rect.width}px`,
              height: `${event.rect.height}px`,
            })

            Object.assign(event.target.dataset, { x, y })
          },
          end: function (event){
            editor.enable();
          }
        }
      })

}

export {addResizeAndDragForElement}