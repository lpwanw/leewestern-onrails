import { Controller } from "@hotwired/stimulus";
import EditorJS from "@editorjs/editorjs";

// Connects to data-controller="comment"
export default class extends Controller {
  static targets = ["content"];

  connect() {
    this.editor = new EditorJS({
      placeholder: "Type something",
      data: this.getInitialContent(),
      readOnly: this.isReadonly(),
      minHeight: 32,
    });
  }

  saveData() {
    this.editor
      .save()
      .then((outputData) => {
        const data = JSON.stringify(outputData);
        this.contentTarget.value = data;
      })
      .catch((error) => {
        console.log("Saving failed: ", error);
      });
  }

  getInitialContent() {
    const hiddenContentField = this.contentTarget;
    if (hiddenContentField?.value) {
      return JSON.parse(hiddenContentField.value);
    }
    return {};
  }

  isReadonly() {
    return this.element.getAttribute("readonly") === "true";
  }
}
