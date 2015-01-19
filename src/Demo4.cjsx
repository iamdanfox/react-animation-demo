
React = require 'react'
require './Demo4.less'
tweenState = require 'react-tween-state'


# Bullet is fired horizontally at 1 pixel per second
class Bullet
  hvel: 10
  vvel: 5

  constructor: ({@x, @y}) ->

  getPosition: (time) =>
    x: @hvel * time + @x
    y: @vvel*time + 0.5*(-0.09)*time*time + @y


module.exports = React.createClass
  displayName: 'Demo4'

  mixins: [tweenState.Mixin]

  getInitialState: ->
    cutOff: 500

  hover: (e) ->
    newCutOff = e.pageX - @refs.r.getDOMNode().getBoundingClientRect().left
    if Math.abs(@state.cutOff - newCutOff) < 30
      @setState(cutOff: newCutOff)
    else
      @tweenState 'cutOff',
        easing: tweenState.easingTypes.easeInOutQuad
        duration: 300
        endValue: newCutOff

  render: ->
    myBullet = new Bullet
      x: 0
      y: 20

    <div className='demo4' style={{height: 200}} onMouseMove={@hover} onClick={@click} ref={'r'}>
      <h1>Demo4</h1>
      { [0..100]
          .map myBullet.getPosition
          .filter (pos) => pos.x < @getTweeningValue('cutOff')
          .map (pos) -> <Dot pos={pos} /> }
    </div>



Dot = React.createClass
  render: ->
    <div className='dot' key={@props.pos.x} style={{left: @props.pos.x, bottom: @props.pos.y}}></div>
