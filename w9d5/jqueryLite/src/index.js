const DomNodeCollection = require("./dom_node_collection.js")

window.$l = (arg) => {
  switch (typeof (arg)) {//return the type of arg
    case "function":
      return registerDocReadyCallback(arg);
    case "string":
      return getNodesFromDom(arg);
    case "object":
      if (arg instanceof HTMLElement) {
        return new DomNodeCollection([arg]);
      }
  } 
}
