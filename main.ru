import telebot
from telebot import types
import bot

bot = telebot.TeleBot(bot.API_TOKIN)

markup_menu = types. ReplyKeyboardMarkup(resize_keyboard=True, row_width=1)
btn_1 = types.KeyboardButton('Первое- Hot entries')
btn_2 = types.KeyboardButton('Второе - Soup')
btn_3 = types.KeyboardButton('Салаты-Salads')
btn_4 = types.KeyboardButton('Десерты-Deserts')
btn_5 = types.KeyboardButton('Напитки-Drinks')
markup_menu.add(btn_1, btn_2, btn_3, btn_4, btn_5)

markup_1 = types. InlineKeyboardMarkup(row_width=1)
btn_11 = types.InlineKeyboardButton(text="Soup", url="https://www.povarenok.ru/recipes/dishes/first/")
markup_1.add(btn_11)

markup_2 = types. InlineKeyboardMarkup(row_width=1)
btn_12 = types.InlineKeyboardButton(text="Hot entries", url="https://www.povarenok.ru/recipes/dishes/main/")
markup_2.add(btn_12)

markup_3 = types. InlineKeyboardMarkup(row_width=1)
btn_13 = types.InlineKeyboardButton(text="Salads", url="https://www.povarenok.ru/recipes/category/12/")
markup_3.add(btn_13)

markup_4 = types. InlineKeyboardMarkup(row_width=1)
btn_14 = types.InlineKeyboardButton(text="Deserts", url="https://www.povarenok.ru/recipes/dishes/sweet/")
markup_4.add(btn_14)

markup_5 = types. InlineKeyboardMarkup(row_width=1)
btn_15 = types.InlineKeyboardButton(text="Drinks", url="https://www.povarenok.ru/recipes/dishes/drink/")
markup_5.add(btn_15)


@bot.message_handler(commands=['start', 'command1'])
def send_welcome(message):
    bot.reply_to(message, "Hello,I am a bot.I will help you to choose food for your taste!", reply_markup=markup_menu)


@bot.message_handler(content_types=['text'])
def main(message):
    if message.text == 'Первое- Hot entries':
        bot.reply_to(message, "Recipe link", reply_markup=markup_1)

    elif message.text == 'Второе - Soup':
        bot.reply_to(message, "Recipe link", reply_markup=markup_2)
        
    elif message.text == 'Салаты-Salads':
        bot.reply_to(message, "Recipe link", reply_markup=markup_3)
    elif message.text == 'Десерты-Deserts':
        bot.reply_to(message, "Recipe link", reply_markup=markup_4)
    elif message.text == 'Напитки-Drinks':
        bot.reply_to(message, "Recipe link", reply_markup=markup_5)


bot.polling()
