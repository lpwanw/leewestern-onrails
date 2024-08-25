import { Controller } from "@hotwired/stimulus";
import EditorJS from "@editorjs/editorjs";
import Header from "@editorjs/header";
import Quote from "@editorjs/quote";

// Connects to data-controller="editor"
export default class extends Controller {
  static targets = ["content"];

  connect() {
    this.editor = new EditorJS({
      placeholder: "Type something",
      data: this.getInitialContent(),
      minHeight: 32,
      tools: {
        header: Header,
        quote: Quote,
      },
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
}
