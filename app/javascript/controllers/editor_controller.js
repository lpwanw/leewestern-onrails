import { Controller } from "@hotwired/stimulus";
import EditorJS from "@editorjs/editorjs";
import Header from "@editorjs/header";
import Quote from "@editorjs/quote";
import editorjsCodecup from '@calumk/editorjs-codecup';

// Connects to data-controller="editor"
export default class extends Controller {
  static targets = ["content"];

  connect() {
    this.editor = new EditorJS({
      placeholder: "Type something",
      data: this.getInitialContent(),
      readOnly: this.isReadonly(),
      minHeight: 32,
      tools: {
        header: Header,
        quote: Quote,
        code: editorjsCodecup,
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

  isReadonly() {
    return this.element.getAttribute("readonly") === "true";
  }
}
