class DomNodeCollection {
  constructor(node) {
    this.nodes = nodes;
    //nodes is array of HTMLElement;
  }

  each(cb) {
    this.nodes.forEach(cb);
  }


  html(html) {
    if (typeof html === "string") {
      this.each((node) => {
        node.innerHTML = html; //innerHTML input text
    });
  } else if (this.nodes.length > 0) {
    return this.nodes[0].innerHTML;
  }
}


  empty() {
    this.html("");
  }

  append(children) {
    if (this.nodes.length === 0) return;
    if (typeof children === "object" && !(children instanceof DomNodeCollection)) {
      children = $l(children);
    }

    if (typeof children === 'string') {
      this.each((node) => {
        node.innerHTML += children;
      });
    }
  }


module.exports = DomNodeCollection; 