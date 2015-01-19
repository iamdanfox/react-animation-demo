React = require 'react/addons'
Demo1 = require './Demo1.cjsx'
Demo2 = require './Demo2.cjsx'
Demo3 = require './Demo3.cjsx'
Demo4 = require './Demo4.cjsx'

window.React = React

App = React.createClass
  render: ->
    <div>
      <Demo1 />
      <Demo2 />
      <Demo3 />
      <Demo4 />
    </div>

window.onload = ->
  React.renderComponent <App />, document.querySelector('body')
