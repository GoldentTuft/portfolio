require('../style/app.scss');
require('../style/reset.scss');
// require('../style/milligram-nav.css');

const { Elm } = require('../Main.elm');

const app = Elm.Main.init({
  node: document.body.appendChild(document.createElement('div')),
  flags: null
});

