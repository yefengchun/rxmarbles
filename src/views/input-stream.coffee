React = require 'react'
Marble = require 'rxmarbles/views/marble'

#
# Renders a stream meant as an input to the play interaction
#
InputStream = React.createClass({
  getInitialState: ->
    return {
      # A serialized stream is an Array representing some emitted items
      serializedStream: [{timestamp: -1}]
    }

  componentWillMount: ->
    this.setState({serializedStream: this.props.serializedStream})

  render: ->
    marbles = [Marble({item: i}) for i in this.state.serializedStream]
    return (
      React.DOM.ul({className: 'stream'},
        React.DOM.div(className: 'arrow', null),
        marbles,
        React.DOM.div(className: 'arrow-head', null)
      )
    )
})

module.exports = InputStream