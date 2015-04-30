# Description:
#   Hubot tells you what Ubereats.es is serving today.
#
# Dependencies:
#   lodash, request, cheerio
#
# Configuration:
#   None
#
# Commands:
#   hubot ubereats [lunch|dinner] - Hubot shows you the menu
#
# Author:
#   github.com/philipbattle
#

_ = require 'lodash'
cheerio = require('cheerio')

module.exports = (robot) ->
  upcoming = []

  robot.http("http://www.ubereats.es/menu?format=json")
    .header('Accept', 'application/json')
    .get() (err, res, body) ->
      if not err
        upcoming = JSON.parse(body).upcoming

  return robot.respond(/ubereats\s?(lunch|dinner)?/i, (msg) ->
    match = msg.match[1];

    if upcoming.length
      today = new Date().toDateString()

      _.each upcoming, (meal) ->
        if new Date(meal.startDate).toDateString() == today
          mealType = meal.tags[0]

          if !match || match is mealType
            $ = cheerio.load(meal.excerpt)

            msg.send mealType
            msg.send meal.title
            msg.send $('p span').first().text();
            msg.send meal.assetUrl
            msg.send ""
    else
      msg.send "Reading data from Ubereats.es"
  )
