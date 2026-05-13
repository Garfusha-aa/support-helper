script_name("Support Helper for Samp-rp")
script_author("garfusha")
script_description("command")
script_version = "1.0"

script_url = "https://raw.githubusercontent.com/Garfusha-aa/support-helper/main/SupportHelper.lua"

version_url = "https://raw.githubusercontent.com/Garfusha-aa/support-helper/main/version.json"

adress = {
	SupportHelper = string.format("%s\\moonloader\\config\\Support Helper", getGameDirectory())
}

if not doesDirectoryExist(adress.SupportHelper) then
	createDirectory(adress.SupportHelper)
end

require("lib.moonloader")

local var_0_0 = require("encoding")
local var_0_1 = require("inicfg")
local encoding = require 'encoding'
local updateStarted = false
local sampev = require 'lib.samp.events'
local var_0_2 = require("vkeys")
local var_0_3 = "moonloader\\config\\Support Helper\\otvets.ini"
local var_0_4 = "moonloader\\config\\Support Helper\\pm.ini"
local sampev = require 'lib.samp.events'
local var_0_6 = require("imgui")
local var_0_5 = require 'lib.samp.events'
local json = require 'cjson'
local faqDatabase = {}
local pendingQuestions = {}

local faqPath = getWorkingDirectory() .. "/config/support_ai.json"

var_0_6.ToggleButton = require("imgui_addons").ToggleButton

local var_0_7 = require("rkeys")
local var_0_8 = var_0_6.ImBuffer(256)
local var_0_9 = var_0_6.ImBuffer(256)

var_0_0.default = "CP1251"
u8 = var_0_0.UTF8

local var_0_10 = {}
local var_0_11 = require("faIcons")
local var_0_12 = var_0_6.ImGlyphRanges({
	var_0_11.min_range,
	var_0_11.max_range
})

function var_0_6.BeforeDrawFrame()
	if fa_font == nil then
		local var_1_0 = var_0_6.ImFontConfig()

		var_1_0.MergeMode = true
		fa_font = var_0_6.GetIO().Fonts:AddFontFromFileTTF("moonloader/resource/fonts/fontawesome-webfont.ttf", 14, var_1_0, var_0_12)
	end
end

local var_0_13 = "[Support Helper]:"
local var_0_14 = "{00BFFF}"
local var_0_15 = 49151
local var_0_16 = "{FFFFFF}"
local var_0_17 = 16777215
local var_0_18 = "{FF0000}"
local var_0_19 = 16711680
local var_0_20 = "{FFA500}"
local var_0_21 = 16753920
local var_0_22 = "{008000}"
local var_0_23 = 32768
local var_0_24 = "{FFE4B5}"
local var_0_25 = 16770229
local var_0_26 = 9055202
local var_0_27 = "{8A2BE2}"
local var_0_28 = "{FF0000}"
local var_0_29 = 16711680
local var_0_30 = "{00FFFF}"
local var_0_31 = 65535
local var_0_32 = "{00FF00}"
local var_0_33 = 65280
local var_0_34 = "{FFFF00}"
local var_0_35 = 16776960
local var_0_36 = var_0_1.load({}, var_0_3)

if not doesDirectoryExist("moonloader\\config\\SupportHelper") then
	createDirectory("moonloader\\config\\SupportHelper")
end

if not doesFileExist("moonloader\\config\\SupportHelper\\otvets.ini") then
	local var_0_37 = io.open("moonloader\\config\\SupportHelper\\otvets.ini", "w+")

	if var_0_37 then
		io.close(var_0_37)
	end
end

local var_0_38 = var_0_1.load({}, var_0_4)

if not doesFileExist("moonloader\\config\\SupportHelper\\pm.ini") then
	local var_0_39 = io.open("moonloader\\config\\SupportHelper\\pm.ini", "w+")

	if var_0_39 then
		io.close(var_0_39)
	end
end

local var_0_40 = false
local var_0_41 = false
local var_0_42 = 0
local var_0_43 = false
local var_0_44 = {}
local var_0_45 = -1
local var_0_46 = {}
local var_0_47 = {}
local var_0_48 = 0
local var_0_49 = 0
local var_0_50 = 0
local var_0_51 = 0
local var_0_52 = ""
local var_0_53 = ""
local var_0_54 = ""
local var_0_55 = {}
local var_0_56 = 0
local var_0_57 = {}
local var_0_58 = ""
local var_0_59 = 0
local var_0_60 = {
	u8("Не выбрано")
}
local var_0_61 = var_0_6.ImInt(0)
local var_0_62 = {
	u8("Не выбрано")
}
local var_0_63 = var_0_6.ImInt(0)
local var_0_64 = 0
local var_0_65 = {}
local var_0_66 = true
local var_0_67 = -1
local var_0_68 = {
	[0] = "Landstalker | Nope | 250.000 | 87 m/h | 3000",
	"Perenniel | Nope | 75.000 | 73 m/h | 900",
	"Previon | Nope | 125.000 | 85 m/h | 1500",
	"Stallion | Nope | 350.000 | 93 m/h | 4200",
	"Solair | Nope | 275.000 | 87 m/h | 3300",
	"Glendale | Nope | 200.000 | 87 m/h | 2400",
	"Sabre | Nope | 375.000 | 96 m/h | 4500",
	"Walton | Nope | 100.000 | 75 m/h | 1200",
	"Regina | Nope | 100.000 | 77 m/h | 1200",
	"Greenwood | Nope | 80.000 | 78 m/h | 960",
	"Nebula | Nope | 300.000 | 87 m/h | 3600",
	"Majestic | Nope | 300.000 | 87 m/h | 3600",
	"Buccaneer | Nope | 325.000 | 91 m/h | 3900",
	"Fortune | Nope | 200.000 | 87 m/h | 2400",
	"Cadrona | Nope | 100.000 | 82 m/h | 1200",
	"Clover | Nope | 275.000 | 91 m/h | 3300",
	"Sadler | Nope | 300.000 | 73 m/h | 3600",
	"Intruder | Nope | 175.000 | 82 m/h | 2100",
	"Primo | Nope | 110.000 | 79 m/h | 1320",
	"Tampa | Nope | 175.000 | 85 m/h | 2100",
	"Savanna | Nope | 650.000 | 96 m/h | 7800",
	"Bravura | D | 100.000 | 81 m/h | 1200",
	"Sentinal | D | 750.000 | 91 m/h | 9000",
	"Voodoo | D | 700.000 | 93 m/h | 8400",
	"Bobcat | D | 825.000 | 82 m/h | 9900",
	"Premier | D | 900.000 | 94 m/h | 10800",
	"Oceanic | D | 125.000 | 87 m/h | 1500",
	"Hermes | D | 150.000 | 82 m/h | 1800",
	"Blista Compact | D | 800.000 | 90 m/h | 9600",
	"Elegant | D | 750.000 | 92 m/h | 9000",
	"Willard | D | 400.000 | 82 m/h | 4800",
	"Blade | D | 750.000 | 96 m/h | 9000",
	"Vincent | D | 400.000 | 82 m/h | 4800",
	"Sunrise | D | 425.000 | 80 m/h | 5100",
	"Merit | D | 525.000 | 87 m/h | 6300",
	"Tahoma | D | 600.000 | 88 m/h | 7200",
	"Broadway | D | 450.000 | 87 m/h | 5400",
	"Tornado | D | 600.000 | 87 m/h | 7200",
	"Emperor | D | 500.000 | 87 m/h | 6000",
	"Picador | D | 550.000 | 82 m/h | 6600",
	"Moonbeam | C | 125.000 | 64 m/h | 1500",
	"Esperanto | C | 250.000 | 82 m/h | 3000",
	"Washington | C | 450.000 | 82 m/h | 5400",
	"Admiral | C | 1.750.000 | 90 m/h | 21000",
	"Rancher | C | 400.000 | 77 m/h | 4800",
	"Virgo | C | 250.000 | 82 m/h | 3000",
	"Feltzer | C | 2.500.000 | 90 m/h | 30000",
	"Remington | C | 1.250.000 | 93 m/h | 15000",
	"Yosemite | C | 625.000 | 84 m/h | 7500",
	"Windsor | C | 1.500.000 | 87 m/h | 18000",
	"Stratum | C | 1.000.000 | 85 m/h | 12000",
	"Huntley | C | 2.500.000 | 87 m/h | 30000",
	"Stafford | C | 2.000.000 | 85 m/h | 24000",
	"Club | C | 500.000 | 90 m/h | 6000",
	"Phoenix | C | 2.500.000 | 95 m/h | 30000",
	"PCJ-600 | C | 2.250.000 | 88 m/h | 27000",
	"BF-400 | C | 3.250.000 | 88 m/h | 39000",
	"Wayfarer | C | 1.000.000 | 87 m/h | 12000",
	"ZR-350 | B | 4.750.000 | 103 m/h | 57000",
	"Comet | B | 6.000.000 | 102 m/h | 72000",
	"Slamvan | B | 1.750.000 | 87 m/h | 21000",
	"Hustler | B | 1.500.000 | 81 m/h | 18000",
	"Uranus | B | 3.000.000 | 86 m/h | 36000",
	"Jester | B | 4.250.000 | 98 m/h | 51000",
	"Sultan | B | 5.000.000 | 94 m/h | 60000",
	"Elegy | B | 4.500.000 | 98 m/h | 54000",
	"Flash | B | 3.500.000 | 91 m/h | 42000",
	"Euros | B | 2.750.000 | 91 m/h | 33000",
	"Alpha | B | 3.000.000 | 93 m/h | 36000",
	"FCR-900 | B | 4.000.000 | 88 m/h | 48000",
	"Freeway | B | 1.500.000 | 79 m/h | 18000",
	"Sanchez | B | 2.750.000 | 79 m/h | 33000",
	"Quad | B | 500.000 | 61 m/h | 6000",
	"Buffalo | A | 5.500.000 | 103 m/h | 66000",
	"Infernus | A | 10.000.000 | 123 m/h | 120000",
	"Cheetah | A | 7.500.000 | 106 m/h | 90000",
	"Banshee | A | 8.000.000 | 112 m/h | 96000",
	"Turismo | A | 8.500.000 | 107 m/h | 102000",
	"Super GT | A | 3.750.000 | 99 m/h | 45000",
	"Bullet | A | 9.000.000 | 112 m/h | 108000",
	"NRG-500 | A | 7.250.000 | 95 m/h | 87000",
	"Hotknife | A | 3.500.000 | 92 m/h | 42000",
	"BF Injection | A | 1.000.000 | 75 m/h | 12000",
	"Sandking | A | 7.750.000 | 97 m/h | 93000",
	"Hotring Racer | A | 9.500.000 | 119 m/h | 114000",
	"Cadillac Escalade | L | 10.000.000 | 111 m/h | 120000",
    "Audi RS5 | L | 14.000.000 | 125 m/h | 114000 | 168000",
    "BMW M5 | L | 16.000.000 | 134 m/h | 192000",
    "Cadillac CTS-L | L | 13.000.000 | 120 m/h | 156000",
    "Ford F-150 | L | 6.000.000 | 105 m/h | 72000",
    "Mercedes-Benz E63 | L | 16.000.000 | 133 m/h | 192000",
    "Stinger Classic | L | 8.500.000 | 107 m/h | 102000",
    "Infernus Sport | L | 11.000.000 | 125 m/h | 132000",
    "Banshee Classic | L | 9.000.000 | 111 m/h | 108000",
    "Deluxo | L | 10.000.000 | 108 m/h | 120000",
    "Patriot H1 | L | Auction | 93 m/h | 114000",
    "Patriot Classic | L | 20000 srpcoins | 90 m/h | 102000",
    "Infiniti QX70 | L | 10.000.000 | 120 m/h | 144000",
    "Kia Stinger | L | 11.500.000 | 126 m/h | 138000",
    "BMW X6 | L | 12.500.000 | 121 m/h | 150000",
    "Chevrolet Suburban | L | 10.000.000 | 111 m/h | 120000",
    "Phobos VT | C | 4.000.000 | 95 m/h | 48000",
    "Idaho | L | 400.000 | 70 m/h | 4800",
    "Polaris V8 | L | 4.000.000 | 96 m/h | 48000",
    "Deimos SP | L | 7.000.000 | 108 m/h | 84000",
    "Forelli ExSess | L | 5.500.000 | 94 m/h | 66000",
    "Sindacco Argento | L | 3.000.000 | 95 m/h | 36000",
    "Manana XS | L | 200.000 | 76 m/h | 2400",
    "Stanier Classic | L | 1.000.000 | 94 m/h | 102000",
    "Echo | L | 1.500.000 | 100 m/h | 18000",
    "V8 Ghost | L | 6.000.000 | 114 m/h | 72000",
    "BF Injection Classic | L | 1.200.000 | 81 m/h | 14400",
    "Hellenbach GT | L | 400.000 | 97 m/h | 4800",
    "Cheetah Pro | L | 8.000.000 | 115 m/h | 96000",
    "Infernus Classic | L | Auction | 128 m/h | 42000",
    "Landstalker XL | L | 500.000 | 91 m/h | 6000",
    "Thunder-Rodd | L | 1.700.000 | 85 m/h | 20400",
    "Bobcat ST | L | 1.500.000 | 89 m/h | 18000",
    "Patriot | S | Auction S от 20.000.000$ | 87 m/h | 120000",
    "Stretch | S | Auction S от 20.000.000$ | 88 m/h | 120000",
    "Romero | S | Auction S от 20.000.000$ | 77 m/h | 120000",
    "Burrito | S | Auction S от 20.000.000$ | 87 m/h | 120000",
    "Caddy | S | Auction S от 20.000.000$ | 87 m/h | 120000",
    "Camper | S | Auction S от 20.000.000$ | 68 m/h | 120000",
    "Mesa | S | Auction S от 20.000.000$ | 78 m/h | 120000",
    "Pizzaboy | S | Auction S от 20.000.000$ | 62 m/h | 120000",
    "Bloodring Banger | S | Auction S от 20.000.000$ | 96 m/h | 120000",
    "BMX | S | Auction S от 20.000.000$ | 40/54 m/h | 120000",
    "Bike | S | Auction S от 20.000.000$ | 44/58 m/h | 120000",
    "Mountain Bike | S | Auction S от 20.000.000$ | 56/72 m/h | 120000",
    "Vortex | S | Auction S от 20.000.000$ | 55 m/h | 120000",
    "Bandito | S | Auction S от 20.000.000$ | 81 m/h | 120000",
    "Kart | S | Auction S от 20.000.000$ | 52 m/h | 120000",
    "Dune | S | Auction S от 20.000.000$ | 61 m/h | 120000",
    "Mower | S | Auction S от 20.000.000$ | 33 m/h | 120000",
    "Cartel Cruiser | L | 5.000.000 | 87 m/h | 60000",
    "Kuruma Classic | L | 600.000 | 93 m/h | 7200",
    "Stretch XS | L | 30000 srpcoins | 92 m/h | 102000",
    "Blista Cabby | L | 1.250.000 | 85 m/h | 15000",
    "BMW E30 | L | 9.000.000 | 118 m/h | 108000",
    "Chevrolet Camaro | L | 12.500.000 | 132 m/h | 150000",
    "BMW M3 | L | 11.500.000 | 118 m/h | 138000",
    "Alfa Romeo | L | 13.000.000 | 134 m/h | 156000",
    "Ford Raptor | L | 4.000.000 | 101 m/h | 48000",
    "Toyota Mark II | L | 8.000.000 | 113 m/h | 96000",
    "Mercedes-Benz G65 | L | 11.000.000 | 118 m/h | 132000",
    "Mercedes-Benz ML 63 | L | 7.000.000 | 110 m/h | 84000",
    "Mercedes-Benz W140 | L | 7.500.000 | 110 m/h | 90000",
    "Subaru BRZ | L | 10.000.000 | 117 m/h | 120000",
    "Subaru Impreza | L | 14.000.000 | 127 m/h | 168000",
    "Tesla Model S | L | Hе продается | 129 m/h",
    "Gang Rancher | L | 750.000 | 82 m/h | 9000",
    "Brigham | L | 900.000 | 94 m/h | 10800",
    "Toyota Prius | L | 6.000.000 | 108 m/h | 72000",
    "Ford Mustang | L | 12.500.000 | 130 m/h | 15000",
    "Lamborghini Urus | L | 17.000.000 | 138 m/h | 204000",
    "Bentley Flying Spur | L | Hе продается | 141 m/h",
    "Tesla Cybertruck | L | Hе продается | 131 m/h",
    "Dodge Viper | L | 14.000.000 | 131 m/h | 168000",
    "Volkswagen Golf | L | 6.000.000 | 105 m/h | 72000",
    "Acura RSX | L | 7.500.000 | 108 m/h | 90000",
    "BMW M4 Competition | L | 17.000.000 | 135 m/h | 204000",
    "BMW X5 | L | 9.000.000 | 102 m/h | 108000",
    "Skoda Octavia A7 | L | 8.000.000 | 107 m/h | 96000",
    "Rolls-Royce Cullinan | L | 20.000.000 | 136 m/h | 240000",
    "Nissan GT-R | L | 13.000.000 | 135 m/h | 156000",
    "Mercedes-Benz GT63s | L | 19.000.000 | 139 m/h | 228000",
    "Mercedes-Benz S63 AMG Coupe | L | 18.000.000 | 138 m/h | 216000",
    "Honda Civic Type R | L | 8.500.000 | 110 m/h | 102000",
    "Mercedes-Benz CLS 63 AMG | L | 16.800.000 | 136 m/h | 201600",
    "Mercedes-Benz A45 S AMG | L | 17.000.000 | 138 m/h | 204000",
    "Dodge Charger SRT Hellcat | L | 16.600.000 | 135 m/h | 192000",
    "Chevrolet Tahoe | L | 6.500.000 | 110 m/h | 78000",
    "Ford Taurus | L | 7.000.000 | 118 m/h | 84000",
    "Ford Explorer | L | 7.000.000 | 115 m/h | 84000",
    "Ford Crown Victoria | L | 4.500.000 | 97 m/h | 54000",
    "Rune Cheburek | L | 1.000.000 | 90 m/h | 12000",
    "Cadillac Escalade 2022 | L | 11.500.000 | 117 m/h | 138000",
    "Ferrari LaFerrari | L | Battlepass 1 season | 145 m/h | 120000",
    "Lexus SC 300 | L | Battlepass 1 season | 124 m/h | 72000",
    "Holden Maloo HSV GTS | L | Battlepass 1 season | 115 m/h | 36000",
    "Hyundai Tiburon | L | Battlepass 1 season | 127 m/h | 36000",
    "McLaren 720s Spider | L | Battlepass 1 season | 145 m/h | 120000"
}
local var_0_69 = {
	[0] = "Банки | /gps 0 0-9",
	"Мэрия | /gps 0 10",
	"Автошкола | /gps 0 11",
	"Авиашкола [LV] | /gps 0 12",
	"Автовокзал (Спавн новичков) | /gps 0 13,15,16",
	"Fort Carson | /gps 0 17",
	"Прием металла | /gps 0 18",
	"Аэропорт [LS] | /gps 0 19",
	"Аэропорт [SF] | /gps 0 20",
	"Аэропорт [LV] | /gps 0 21",
	"Пляж Santa Maria | /gps 0 24",
	"Спортзал [LS] | /gps 0 26",
	"Спортзал [SF] | /gps 0 27",
	"Спортзал [LV] | /gps 0 28",
	"Развлекательные центры | /gps 0 29-31",
	"Церковь | /gps 0 32",
	"Военкомат СФ | /gps 0 33",
	"Военкомат ЛВ | /gps 0 34",
	"Торговая площадка | /gps 0 35",
	"Черный рынок | /gps 0 36",
	"Кладбище | /gps 0 37",
	"Тренинг центр | /gps 0 38",
	"Военный музей | /gps 0 39",
	"Суд | /gps 0 40",
	"Рыболовный магазин [Whetstone] | /gps 0 42",
	"Рыболовный магазин [Bone] | /gps 0 43",
	"Склад с алкоголем | /gps 1 0",
	"Нефтезавод | /gps 1 1",
	"Склад продуктов | /gps 1 2",
	"Склад для урожая с ферм | /gps 1 3",
	"Стоянка машин Хот догов | /gps 1 4",
	"Стоянка Инкассаторов | /gps 1 5",
	"Работа грузчика | /gps 1 6",
	"Склад с наркотиками | /gps 1 7",
	"Стоянка грабителей ЛЭП | /gps 1 9",
	"Стоянка электриков | /gps 1 10",
	"Ограбление домов | /gps 1 11",
	"Оружейный завод | /gps 1 12",
	"Продажа шкур животных | /gps 1 13",
	"Склад ЛС/СФ/ЛВ | /gps 1 14-16",
	"Автобусный парк [LS] | /gps 1 17",
	"Автобусный парк [SF] | /gps 1 18",
	"Автобусный парк [LV] | /gps 1 19",
	"Автобусные парки | /gps 1 17-19",
	"Автоугон [LS] | /gps 1 20",
	"Автоугон [SF] | /gps 1 21",
	"Автоугон [LV] | /gps 1 22",
	"Автоугон все места | /gps 1 20-22",
	"Сумка для ограбления банка | /gps 1 23-26",
	"Автосалон: Nope | /gps 3 0",
	"Автосалон: D and C | /gps 3 1",
	"Автосалон: L | /gps 3 2",
	"Аукцион авто: S | /gps 3 3",
	"Автосалон: B and A | /gps 3 4",
	"Магазин одежды [LS] | /gps 3 5",
	"Магазин одежды [SF] | /gps 3 6",
	"Магазин одежды [LV] | /gps 3 7",
	"Магазин аксессуаров [SF] | /gps 3 8",
	"Магазин оружия | /gps 3 9-19",
	"Аренда вертолета [LS] | /gps 3 20",
	"Аренда вертолета [SF] | /gps 3 21",
	"Аренда вертолета [LV] | /gps 3 22",
	"Аренда вертолета [LS/SF/LV] | /gps 3 20-22",
	"Аренда самолета [LV] | /gps 3 23",
	"Покупка водного транспорта | /gps 3 24",
	"Притоны | /gps 3 25-29",
	"Фермы | /gps 5",
	"Дальнобойщики | /gps 6",
	"СТО | /gps 11",
	"Гаражи | /gps 12",
	"Офисы | /gps 13",
	"Казино Four Dragons и Caligula находятся рядом с этим баром | /gps 2 14",
	"Для офисов | /gps 14"
}
local var_0_70 = {
	"Банки",
	"Мэрия",
	"Автошкола",
	"Авиашкола [LV]",
	"Автовокзал (Спавн новичков)",
	"Fort Carson",
	"Прием металла",
	"Аэропорт [LS]",
	"Аэропорт [SF]",
	"Аэропорт [LV]",
	"Пляж Santa Maria",
	"Спортзал [LS]",
	"Спортзал [SF]",
	"Спортзал [LV]",
	"Развлекательные центры",
	"Церковь",
	"Военкомат СФ",
	"Военкомат ЛВ",
	"Торговая площадка",
	"Черный рынок",
	"Кладбище",
	"Тренинг центр",
	"Военный музей",
	"Суд",
	"Рыболовный магазин [Whetstone]",
	"Рыболовный магазин [Bone]",
	"Склад с алкоголем",
	"Нефтезавод",
	"Склад продуктов",
	"Склад для урожая с ферм",
	"Стоянка машин Хот догов",
	"Стоянка Инкассаторов",
	"Работа грузчика",
	"Склад с наркотиками",
	"Стоянка грабителей ЛЭП",
	"Стоянка электриков",
	"Ограбление домов",
	"Оружейный завод",
	"Продажа шкур животных",
	"Склад ЛС/СФ/ЛВ",
	"Автобусный парк [LS]",
	"Автобусный парк [SF]",
	"Автобусный парк [LV]",
	"Автобусные парки",
	"Автоугон [LS]",
	"Автоугон [SF]",
	"Автоугон [LV]",
	"Автоугон все места",
	"Сумка для ограбления банка",
	"Автосалон: Nope",
	"Автосалон: D and C",
	"Автосалон: L",
	"Аукцион авто: S",
	"Автосалон: B and A",
	"Магазин одежды [LS] ",
	"Магазин одежды [SF] ",
	"Магазин одежды [LV] ",
	"Магазин аксессуаров [SF]",
	"Магазин оружия",
	"Аренда вертолета [LS]",
	"Аренда вертолета [SF]",
	"Аренда вертолета [LV]",
	"Аренда вертолета [LS/SF/LV]",
	"Аренда самолета",
	"Покупка водного транспорта",
	"Притоны",
	"Фермы",
	"Дальнобойщики",
	"СТО",
	"Гаражи",
	"Офисы",
	"Казино",
	"Для офисов"
}
local var_0_71, var_0_72 = getScreenResolution()
local var_0_73 = 0
local var_0_74 = var_0_6.ImBuffer(50)
local var_0_75 = var_0_6.ImBuffer(65536)
local var_0_76 = {
	tag = {
		activeclearchatsupports = false,
		active_infoscreen_otvet_ = false,
		active5 = false,
		activeotvetcolor = false,
		activesupcolor = false,
		FontName = "Arial",
		myotvetcolor = "FFFFFF",
		FontName_infoscreen_otvet_ = "Arial",
		global_Line = 10,
		KeyWindowPM = "VK_X",
		activemyotvetcolor = false,
		KeyPMLast = "VK_X",
		FontSize_infoscreen_otvet_ = 15,
		activechatsup = false,
		global_Line2 = 10,
		active6 = false,
		activevop = false,
		active3 = false,
		supchatcolor = "FFFFFF",
		color = "FFFFFF",
		keyrenderchatsupports = "VK_K",
		FontFlag_infoscreen_otvet_ = 13,
		SupportName = "",
		activeokno_infoscreen_otvet_ = false,
		Keyokno = "VK_K",
		infoscreen_otvet_ = "FFFFFF",
		active2 = false,
		otvetcolor = "FFFFFF",
		global_FontSize1 = 15,
		activeAutoSduty = false,
		global_FontSize = 15,
		activerenderchatsupports = false,
		global_FontFlag = 13,
		vopchatcolor = "FFFFFF"
	},
	pos = {
		x = select(1, getScreenResolution()),
		y = select(2, getScreenResolution())
	},
	posT = {
		xx = select(1, getScreenResolution()),
		yy = select(2, getScreenResolution())
	},
	posT1 = {
		xx = select(1, getScreenResolution()),
		yy = select(2, getScreenResolution())
	},
	posT2 = {
		xx = select(1, getScreenResolution()),
		yy = select(2, getScreenResolution())
	},
	onDay = {
		online = 0,
		today = os.date("%a")
	},
	onWeek = {
		week = 1,
		online = 0
	},
	myWeekOnline = {
		[0] = 0,
		0,
		0,
		0,
		0,
		0,
		0
	}
}
local var_0_77 = {
	Weekset = {
		week = 1,
		onlinereting = 0,
		online = 0
	}
}
local var_0_78 = var_0_1.load(var_0_77, "SupportHelper\\pm-settings.ini")

if not doesFileExist("moonloader\\config\\SupportHelper\\pm-settings.ini") then
	var_0_1.save(var_0_77, "SupportHelper\\pm-settings.ini")
end

local var_0_79 = var_0_1.load(var_0_76, "SupportHelper\\SH-settings.ini")

if not doesFileExist("moonloader\\config\\SupportHelper\\SH-settings.ini") then
	var_0_1.save(var_0_76, "SupportHelper\\SH-settings.ini")
end

local var_0_80 = var_0_76.pos.x
local var_0_81 = var_0_76.pos.y
local var_0_82 = var_0_76.posT.xx
local var_0_83 = var_0_76.posT.yy
local var_0_84 = var_0_76.posT1.xx
local var_0_85 = var_0_76.posT1.yy
local var_0_86 = var_0_76.posT2.xx
local var_0_87 = var_0_76.posT2.yy
local var_0_88 = {
	infoscreenaRotvet = 0,
	infoscreenaOtvet = 0,
	infoscreen_aHour = 0,
	imgui_active = var_0_6.ImBool(false),
	imgui_active2 = var_0_6.ImBool(false),
	imgui_active3 = var_0_6.ImBool(false),
	imgui_active4 = var_0_6.ImBool(false),
	imgui_active5 = var_0_6.ImBool(false),
	window_12 = var_0_6.ImBool(false),
	activeAutoSduty = var_0_6.ImBool(var_0_76.tag.activeAutoSduty),
	active2 = var_0_6.ImBool(var_0_79.tag.active2),
	active3 = var_0_6.ImBool(var_0_79.tag.active3),
	active6 = var_0_6.ImBool(var_0_79.tag.active6),
	active5 = var_0_6.ImBool(var_0_79.tag.active5),
	color = var_0_6.ImBuffer(tostring(var_0_79.tag.color), 7),
	SupportName = var_0_6.ImBuffer(tostring(var_0_79.tag.SupportName), 250),
	FontName = var_0_6.ImBuffer(tostring(var_0_79.tag.FontName), 250),
	FontName_infoscreen_otvet_ = var_0_6.ImBuffer(tostring(var_0_79.tag.FontName_infoscreen_otvet_), 250),
	global_FontSize = var_0_6.ImFloat(var_0_76.tag.global_FontSize),
	global_FontFlag = var_0_6.ImFloat(var_0_76.tag.global_FontFlag),
	FontFlag_infoscreen_otvet_ = var_0_6.ImFloat(var_0_76.tag.FontFlag_infoscreen_otvet_),
	global_FontSize1 = var_0_6.ImFloat(var_0_76.tag.global_FontSize1),
	FontSize_infoscreen_otvet_ = var_0_6.ImFloat(var_0_76.tag.FontSize_infoscreen_otvet_),
	global_Line = var_0_6.ImFloat(var_0_76.tag.global_Line),
	global_Line2 = var_0_6.ImFloat(var_0_76.tag.global_Line2),
	activesupcolor = var_0_6.ImBool(var_0_76.tag.activesupcolor),
	activechatsup = var_0_6.ImBool(var_0_76.tag.activechatsup),
	supchatcolor = var_0_6.ImBuffer(tostring(var_0_76.tag.supchatcolor), 7),
	sesOnline = var_0_6.ImInt(0),
	sesFull = var_0_6.ImInt(0),
	sesAfk = var_0_6.ImInt(0),
	activevop = var_0_6.ImBool(var_0_76.tag.activevop),
	active_infoscreen_otvet_ = var_0_6.ImBool(var_0_76.tag.active_infoscreen_otvet_),
	vopchatcolor = var_0_6.ImBuffer(tostring(var_0_76.tag.vopchatcolor), 7),
	infoscreen_otvet_ = var_0_6.ImBuffer(tostring(var_0_76.tag.infoscreen_otvet_), 7),
	otvetcolor = var_0_6.ImBuffer(tostring(var_0_76.tag.otvetcolor), 7),
	activeotvetcolor = var_0_6.ImBool(var_0_76.tag.activeotvetcolor),
	myotvetcolor = var_0_6.ImBuffer(tostring(var_0_76.tag.myotvetcolor), 7),
	activemyotvetcolor = var_0_6.ImBool(var_0_76.tag.activemyotvetcolor),
	activerenderchatsupports = var_0_6.ImBool(var_0_79.tag.activerenderchatsupports),
	activeokno_infoscreen_otvet_ = var_0_6.ImBool(var_0_79.tag.activeokno_infoscreen_otvet_),
	activeclearchatsupports = var_0_6.ImBool(var_0_79.tag.activeclearchatsupports),
	aifaqsystem = var_0_6.ImBool(false)
}
local var_0_89 = os.date("%H:%M:%S", os.time())
local var_0_90 = {
	[0] = "Воскресенье",
	"Понедельник",
	"Вторник",
	"Среда",
	"Четверг",
	"Пятница",
	"Суббота"
}

font = renderCreateFont(var_0_76.tag.FontName, var_0_76.tag.global_FontSize, var_0_76.tag.global_FontFlag)
font1 = renderCreateFont(var_0_76.tag.FontName, var_0_76.tag.global_FontSize1, var_0_76.tag.global_FontFlag)
font2 = renderCreateFont(var_0_76.tag.FontName, var_0_76.tag.global_FontSize, var_0_76.tag.global_FontFlag)
font3 = renderCreateFont(var_0_76.tag.FontName_infoscreen_otvet_, var_0_76.tag.FontSize_infoscreen_otvet_, var_0_76.tag.FontFlag_infoscreen_otvet_)

function var_0_6.TextColoredRGB(arg_2_0, arg_2_1)
	local var_2_0 = var_0_6.GetWindowWidth()
	local var_2_1 = var_0_6.GetStyle().Colors
	local var_2_2 = var_0_6.ImVec4

	local function var_2_3(arg_3_0)
		local var_3_0 = bit.band(bit.rshift(arg_3_0, 24), 255)
		local var_3_1 = bit.band(bit.rshift(arg_3_0, 16), 255)
		local var_3_2 = bit.band(bit.rshift(arg_3_0, 8), 255)
		local var_3_3 = bit.band(arg_3_0, 255)

		return var_3_0, var_3_1, var_3_2, var_3_3
	end

	local function var_2_4(arg_4_0)
		if arg_4_0:sub(1, 6):upper() == "SSSSSS" then
			local var_4_0 = var_2_1[1].x
			local var_4_1 = var_2_1[1].y
			local var_4_2 = var_2_1[1].z
			local var_4_3 = tonumber(arg_4_0:sub(7, 8), 16) or var_2_1[1].w * 255

			return var_2_2(var_4_0, var_4_1, var_4_2, var_4_3 / 255)
		end

		local var_4_4 = type(arg_4_0) == "string" and tonumber(arg_4_0, 16) or arg_4_0

		if type(var_4_4) ~= "number" then
			return
		end

		local var_4_5, var_4_6, var_4_7, var_4_8 = var_2_3(var_4_4)

		return var_0_6.ImColor(var_4_5, var_4_6, var_4_7, var_4_8):GetVec4()
	end

	;(function(arg_5_0)
		for iter_5_0 in arg_5_0:gmatch("[^\r\n]+") do
			local var_5_0 = {}
			local var_5_1 = {}
			local var_5_2 = 1

			iter_5_0 = iter_5_0:gsub("{(......)}", "{%1FF}")

			while iter_5_0:find("{........}") do
				local var_5_3, var_5_4 = iter_5_0:find("{........}")
				local var_5_5 = var_2_4(iter_5_0:sub(var_5_3 + 1, var_5_4 - 1))

				if var_5_5 then
					var_5_0[#var_5_0], var_5_0[#var_5_0 + 1] = iter_5_0:sub(var_5_2, var_5_3 - 1), iter_5_0:sub(var_5_4 + 1, #iter_5_0)
					var_5_1[#var_5_1 + 1] = var_5_5
					var_5_2 = var_5_3
				end

				iter_5_0 = iter_5_0:sub(1, var_5_3 - 1) .. iter_5_0:sub(var_5_4 + 1, #iter_5_0)
			end

			local var_5_6 = var_0_6.CalcTextSize(iter_5_0)

			if arg_2_1 == 2 then
				var_0_6.NewLine()
				var_0_6.SameLine(var_2_0 / 2 - var_5_6.x / 2)
			elseif arg_2_1 == 3 then
				var_0_6.NewLine()
				var_0_6.SameLine(var_2_0 - var_5_6.x - 5)
			end

			if var_5_0[0] then
				for iter_5_1 = 0, #var_5_0 do
					var_0_6.TextColored(var_5_1[iter_5_1] or var_2_1[1], var_5_0[iter_5_1])
					var_0_6.SameLine(nil, 0)
				end

				var_0_6.NewLine()
			else
				var_0_6.Text(iter_5_0)
			end
		end
	end)(arg_2_0)
end
function autoupdate()

    lua_thread.create(function()

        local jsonFile =
            getWorkingDirectory() ..
            "\\config\\supporthelper_version.json"

        downloadUrlToFile(
            version_url,
            jsonFile
        )

        wait(3000)

        local file = io.open(jsonFile, "r")

        if file then

            local content = file:read("*a")
            file:close()

            local data = decodeJson(content)

            if data.version ~= script_version and not updateStarted then

    updateStarted = true

                sampAddChatMessage(
                    "{FFFF00}Support Helper | {8B0000}Найдено обновление!",
                    -1
                )

                downloadUrlToFile(
                    data.updateurl,
                    thisScript().path
                )

                sampAddChatMessage(
                    "{FFFF00}Support Helper | {32CD32}Скрипт обновлен! Перезапустите игру.",
                    -1
                )

            else

                sampAddChatMessage(
                    "{FFFF00}Support Helper | {FFFACD}У вас актуальная версия.",
                    -1
                )
            end
        end
    end)
end
            
function main()
	if not isSampLoaded() or not isSampfuncsLoaded() then
		return
	end

	while not isSampAvailable() do
		wait(0)
	end
	autoupdate()

	local var_6_0, var_6_1 = sampGetPlayerIdByCharHandle(PLAYER_PED)
	local var_6_2 = sampGetPlayerNickname(var_6_1)

	if var_6_2 == "Etienne_Kavinsky" or var_6_2 == "Ratnik_Cybersport" or var_6_2 == "Dardas_Beretta" or var_6_2 == "William_Adomson" then
		sampAddChatMessage(var_0_13 .. " {FF0000}Внимание! [ {FFFFFF}Вам ограничен доступ к данному скрипту{FF0000} ]", 16776960)
		sampAddChatMessage(var_0_13 .. " {FF0000}Внимание! [ {FFFFFF}Для получения доступа к скрипту свяжитесь с разработчиком скрипта{FF0000} ]", 16776960)
		thisScript():unload()
	else
		sampAddChatMessage("{EEE8AA}---------- Support Helper for Samp-RP ----------", -1)
sampAddChatMessage("{FFFFFF}Статус: {00FF00}Активирован", -1)
sampAddChatMessage("{FFFFFF}Меню: {FFE4B5}/shelper", -1)
sampAddChatMessage("{FFFFFF}Dev: {008000}Garfushaaaaaaaaa", -1)
	end

	for iter_6_0, iter_6_1 in pairs(var_0_36) do
		table.insert(var_0_60, u8(iter_6_1.name))
	end

	for iter_6_2, iter_6_3 in pairs(var_0_36) do
		table.insert(var_0_62, u8(iter_6_3.name))
	end

	if var_0_76.onDay.today ~= os.date("%a") then
		var_0_76.onDay.today = os.date("%a")
		var_0_76.onDay.online = 0

		var_0_1.save(var_0_76, "Support Helper\\SH-settings.ini")
	end

	if var_0_76.onWeek.week ~= number_week() then
		var_0_76.onWeek.week = number_week()
		var_0_76.onWeek.online = 0

		for iter_6_4, iter_6_5 in pairs(var_0_76.myWeekOnline) do
			iter_6_5 = 0
		end

		var_0_76.myWeekOnline[0] = 0
		var_0_76.myWeekOnline[1] = 0
		var_0_76.myWeekOnline[2] = 0
		var_0_76.myWeekOnline[3] = 0
		var_0_76.myWeekOnline[4] = 0
		var_0_76.myWeekOnline[5] = 0
		var_0_76.myWeekOnline[6] = 0

		var_0_1.save(var_0_76, "Support Helper\\SH-settings.ini")
	end

	if var_0_77.Weekset.week ~= number_week() then
		var_0_77.Weekset.week = number_week()
		var_0_77.Weekset.online = 0
		var_0_77.Weekset.onlinereting = 0

		var_0_1.save(var_0_77, "Support Helper\\pm-settings.ini")
	end

	lua_thread.create(time)
	lua_thread.create(autoSave)
	lua_thread.create(number_week)

	img = var_0_6.CreateTextureFromFile(getGameDirectory() .. "\\moonloader\\config\\1.png")
	img1 = var_0_6.CreateTextureFromFile(getGameDirectory() .. "\\moonloader\\config\\2.png")

	local var_6_3, var_6_4 = sampGetPlayerIdByCharHandle(PLAYER_PED)
	local var_6_5 = sampGetPlayerNickname(var_6_4)

	sampRegisterChatCommand("pmset", function()
		var_0_88.imgui_active.v = not var_0_88.imgui_active.v
	end)
	sampRegisterChatCommand("skinid", function(arg_8_0)
		if arg_8_0:find("(%d+) (%d+)") then
			local var_8_0, var_8_1 = arg_8_0:match("(%d+) (%d+)")

			if var_8_1 == "35" or var_8_1 == "36" or var_8_1 == "37" or var_8_1 == "78" or var_8_1 == "79" or var_8_1 == "95" or var_8_1 == "134" or var_8_1 == "136" or var_8_1 == "137" or var_8_1 == "212" or var_8_1 == "230" or var_8_1 == "90" or var_8_1 == "193" or var_8_1 == "55" or var_8_1 == "75" or var_8_1 == "77" or var_8_1 == "200" or var_8_1 == "135" or var_8_1 == "96" or var_8_1 == "155" or var_8_1 == "160" or var_8_1 == "25" or var_8_1 == "26" or var_8_1 == "58" or var_8_1 == "143" or var_8_1 == "235" or var_8_1 == "202" or var_8_1 == "13" or var_8_1 == "53" or var_8_1 == "199" or var_8_1 == "73" or var_8_1 == "44" or var_8_1 == "43" or var_8_1 == "14" or var_8_1 == "142" or var_8_1 == "210" or var_8_1 == "24" or var_8_1 == "63" or var_8_1 == "64" or var_8_1 == "197" or var_8_1 == "207" or var_8_1 == "243" or var_8_1 == "60" or var_8_1 == "8" or var_8_1 == "184" or var_8_1 == "2" or var_8_1 == "182" or var_8_1 == "234" or var_8_1 == "88" or var_8_1 == "151" or var_8_1 == "218" or var_8_1 == "231" or var_8_1 == "6" or var_8_1 == "179" or var_8_1 == "67" or var_8_1 == "23" or var_8_1 == "32" or var_8_1 == "128" or var_8_1 == "9" or var_8_1 == "225" or var_8_1 == "183" or var_8_1 == "241" or var_8_1 == "30" or var_8_1 == "22" or var_8_1 == "7" or var_8_1 == "33" or var_8_1 == "40" or var_8_1 == "245" or var_8_1 == "154" or var_8_1 == "84" or var_8_1 == "185" or var_8_1 == "166" or var_8_1 == "291" or var_8_1 == "255" or var_8_1 == "21" or var_8_1 == "42" or var_8_1 == "25" or var_8_1 == "188" or var_8_1 == "238" or var_8_1 == "192" or var_8_1 == "215" or var_8_1 == "20" or var_8_1 == "28" or var_8_1 == "29" or var_8_1 == "142" or var_8_1 == "19" or var_8_1 == "177" or var_8_1 == "176" or var_8_1 == "180" or var_8_1 == "47" or var_8_1 == "48" or var_8_1 == "97" or var_8_1 == "4" or var_8_1 == "82" or var_8_1 == "250" or var_8_1 == "242" or var_8_1 == "227" or var_8_1 == "228" or var_8_1 == "121" or var_8_1 == "247" or var_8_1 == "117" or var_8_1 == "258" or var_8_1 == "259" or var_8_1 == "18" or var_8_1 == "45" or var_8_1 == "249" or var_8_1 == "83" or var_8_1 == "273" or var_8_1 == "123" or var_8_1 == "111" or var_8_1 == "124" or var_8_1 == "170" or var_8_1 == "12" or var_8_1 == "93" or var_8_1 == "172" or var_8_1 == "211" or var_8_1 == "224" or var_8_1 == "251" or var_8_1 == "233" or var_8_1 == "299" or var_8_1 == "119" or var_8_1 == "292" or var_8_1 == "293" or var_8_1 == "297" or var_8_1 == "296" or var_8_1 == "3" or var_8_1 == "289" or var_8_1 == "127" or var_8_1 == "118" or var_8_1 == "112" or var_8_1 == "152" or var_8_1 == "216" or var_8_1 == "219" or var_8_1 == "298" or var_8_1 == "61" or var_8_1 == "5" or var_8_1 == "126" or var_8_1 == "290" or var_8_1 == "248" or var_8_1 == "223" or var_8_1 == "144" or var_8_1 == "208" or var_8_1 == "272" or var_8_1 == "261" or var_8_1 == "190" or var_8_1 == "237" or var_8_1 == "148" or var_8_1 == "263" or var_8_1 == "294" or var_8_1 == "295" or var_8_1 == "100" or var_8_1 == "46" or var_8_1 == "113" or var_8_1 == "125" or var_8_1 == "76" or var_8_1 == "91" or var_8_1 == "141" or var_8_1 == "150" or var_8_1 == "169" or var_8_1 == "214" or var_8_1 == "51" or var_8_1 == "52" or var_8_1 == "72" or var_8_1 == "94" or var_8_1 == "133" or var_8_1 == "206" or var_8_1 == "262" or var_8_1 == "85" or var_8_1 == "87" or var_8_1 == "138" or var_8_1 == "139" or var_8_1 == "244" or var_8_1 == "257" or var_8_1 == "256" then
				if var_8_1 == "35" or var_8_1 == "36" or var_8_1 == "37" or var_8_1 == "78" or var_8_1 == "79" or var_8_1 == "95" or var_8_1 == "134" or var_8_1 == "136" or var_8_1 == "137" or var_8_1 == "212" or var_8_1 == "230" or var_8_1 == "90" or var_8_1 == "193" or var_8_1 == "55" or var_8_1 == "75" or var_8_1 == "77" then
					if var_8_1 == "35" or var_8_1 == "36" or var_8_1 == "37" or var_8_1 == "78" or var_8_1 == "79" or var_8_1 == "95" or var_8_1 == "134" or var_8_1 == "136" or var_8_1 == "137" or var_8_1 == "212" or var_8_1 == "230" then
						lua_thread.create(function()
							local var_9_0 = "Skin 35 | M | 1.000(700 при /boostinfo)"
							local var_9_1, var_9_2, var_9_3 = string.match(var_9_0, "Skin (.+) | (.+) | (.+)")
							local var_9_4 = string.format("/pm %s Скин | ID: %s | %s | %s", var_8_0, var_8_1, "М", var_9_3)

							wait(50)
							sampSetChatInputText(var_9_4)
							sampSetChatInputEnabled(true)
						end)
					elseif var_8_1 == "90" or var_8_1 == "193" or var_8_1 == "55" or var_8_1 == "75" or var_8_1 == "77" then
						lua_thread.create(function()
							local var_10_0 = "Skin 35 | M | 1.000(700 при /boostinfo)"
							local var_10_1, var_10_2, var_10_3 = string.match(var_10_0, "Skin (.+) | (.+) | (.+)")
							local var_10_4 = string.format("/pm %s Скин | ID: %s | %s | %s", var_8_0, var_8_1, "Ж", var_10_3)

							wait(50)
							sampSetChatInputText(var_10_4)
							sampSetChatInputEnabled(true)
						end)
					end
				elseif var_8_1 == "200" or var_8_1 == "135" or var_8_1 == "96" or var_8_1 == "155" or var_8_1 == "160" or var_8_1 == "25" or var_8_1 == "26" or var_8_1 == "58" or var_8_1 == "143" or var_8_1 == "235" or var_8_1 == "202" or var_8_1 == "13" or var_8_1 == "53" or var_8_1 == "199" then
					if var_8_1 == "200" or var_8_1 == "135" or var_8_1 == "96" or var_8_1 == "155" or var_8_1 == "160" or var_8_1 == "25" or var_8_1 == "26" or var_8_1 == "58" or var_8_1 == "143" or var_8_1 == "235" or var_8_1 == "202" then
						lua_thread.create(function()
							local var_11_0 = "Skin 200 | M | 10.000(7.000 при /boostinfo)"
							local var_11_1, var_11_2, var_11_3 = string.match(var_11_0, "Skin (.+) | (.+) | (.+)")
							local var_11_4 = string.format("/pm %s Скин | ID: %s | %s | %s", var_8_0, var_8_1, "М", var_11_3)

							wait(50)
							sampSetChatInputText(var_11_4)
							sampSetChatInputEnabled(true)
						end)
					elseif var_8_1 == "13" or var_8_1 == "53" or var_8_1 == "199" then
						lua_thread.create(function()
							local var_12_0 = "Skin 200 | M | 10.000(7.000 при /boostinfo)"
							local var_12_1, var_12_2, var_12_3 = string.match(var_12_0, "Skin (.+) | (.+) | (.+)")
							local var_12_4 = string.format("/pm %s Скин | ID: %s | %s | %s", var_8_0, var_8_1, "Ж", var_12_3)

							wait(50)
							sampSetChatInputText(var_12_4)
							sampSetChatInputEnabled(true)
						end)
					end
				elseif var_8_1 == "73" or var_8_1 == "44" or var_8_1 == "43" or var_8_1 == "14" or var_8_1 == "142" or var_8_1 == "210" or var_8_1 == "24" or var_8_1 == "63" or var_8_1 == "64" or var_8_1 == "197" or var_8_1 == "207" or var_8_1 == "243" then
					if var_8_1 == "73" or var_8_1 == "44" or var_8_1 == "43" or var_8_1 == "14" or var_8_1 == "142" or var_8_1 == "210" or var_8_1 == "24" then
						lua_thread.create(function()
							local var_13_0 = "Skin 63 | Ж | 50.000(35.000 при /boostinfo)"
							local var_13_1, var_13_2, var_13_3 = string.match(var_13_0, "Skin (.+) | (.+) | (.+)")
							local var_13_4 = string.format("/pm %s Скин | ID: %s | %s | %s", var_8_0, var_8_1, "М", var_13_3)

							wait(50)
							sampSetChatInputText(var_13_4)
							sampSetChatInputEnabled(true)
						end)
					elseif var_8_1 == "63" or var_8_1 == "64" or var_8_1 == "197" or var_8_1 == "207" or var_8_1 == "243" then
						lua_thread.create(function()
							local var_14_0 = "Skin 63 | Ж | 50.000(35.000 при /boostinfo)"
							local var_14_1, var_14_2, var_14_3 = string.match(var_14_0, "Skin (.+) | (.+) | (.+)")
							local var_14_4 = string.format("/pm %s Скин | ID: %s | %s | %s", var_8_0, var_8_1, "Ж", var_14_3)

							wait(50)
							sampSetChatInputText(var_14_4)
							sampSetChatInputEnabled(true)
						end)
					end
				elseif var_8_1 == "60" or var_8_1 == "8" or var_8_1 == "184" or var_8_1 == "2" or var_8_1 == "182" or var_8_1 == "234" or var_8_1 == "88" or var_8_1 == "151" or var_8_1 == "218" or var_8_1 == "231" then
					if var_8_1 == "60" or var_8_1 == "8" or var_8_1 == "184" or var_8_1 == "2" or var_8_1 == "182" or var_8_1 == "234" then
						lua_thread.create(function()
							local var_15_0 = "Skin 88 | Ж | 100.000(70.000 при /boostinfo)"
							local var_15_1, var_15_2, var_15_3 = string.match(var_15_0, "Skin (.+) | (.+) | (.+)")
							local var_15_4 = string.format("/pm %s Скин | ID: %s | %s | %s", var_8_0, var_8_1, "М", var_15_3)

							wait(50)
							sampSetChatInputText(var_15_4)
							sampSetChatInputEnabled(true)
						end)
					elseif var_8_1 == "88" or var_8_1 == "151" or var_8_1 == "218" or var_8_1 == "231" then
						lua_thread.create(function()
							local var_16_0 = "Skin 88 | Ж | 100.000(70.000 при /boostinfo)"
							local var_16_1, var_16_2, var_16_3 = string.match(var_16_0, "Skin (.+) | (.+) | (.+)")
							local var_16_4 = string.format("/pm %s Скин | ID: %s | %s | %s", var_8_0, var_8_1, "Ж", var_16_3)

							wait(50)
							sampSetChatInputText(var_16_4)
							sampSetChatInputEnabled(true)
						end)
					end
				elseif var_8_1 == "6" or var_8_1 == "179" or var_8_1 == "67" or var_8_1 == "23" or var_8_1 == "32" or var_8_1 == "128" or var_8_1 == "9" or var_8_1 == "225" then
					if var_8_1 == "6" or var_8_1 == "179" or var_8_1 == "67" or var_8_1 == "23" or var_8_1 == "32" or var_8_1 == "128" then
						lua_thread.create(function()
							local var_17_0 = "Skin 9 | Ж | 250.000(175.000 при /boostinfo)"
							local var_17_1, var_17_2, var_17_3 = string.match(var_17_0, "Skin (.+) | (.+) | (.+)")
							local var_17_4 = string.format("/pm %s Скин | ID: %s | %s | %s", var_8_0, var_8_1, "М", var_17_3)

							wait(50)
							sampSetChatInputText(var_17_4)
							sampSetChatInputEnabled(true)
						end)
					elseif var_8_1 == "9" or var_8_1 == "225" then
						lua_thread.create(function()
							local var_18_0 = "Skin 9 | Ж | 250.000(175.000 при /boostinfo)"
							local var_18_1, var_18_2, var_18_3 = string.match(var_18_0, "Skin (.+) | (.+) | (.+)")
							local var_18_4 = string.format("/pm %s Скин | ID: %s | %s | %s", var_8_0, var_8_1, "Ж", var_18_3)

							wait(50)
							sampSetChatInputText(var_18_4)
							sampSetChatInputEnabled(true)
						end)
					end
				elseif var_8_1 == "183" or var_8_1 == "241" or var_8_1 == "30" or var_8_1 == "22" or var_8_1 == "7" or var_8_1 == "33" or var_8_1 == "40" or var_8_1 == "245" then
					if var_8_1 == "183" or var_8_1 == "241" or var_8_1 == "30" or var_8_1 == "22" or var_8_1 == "7" or var_8_1 == "33" then
						lua_thread.create(function()
							local var_19_0 = "Skin 40 | Ж | 500.000(350.000 при /boostinfo)"
							local var_19_1, var_19_2, var_19_3 = string.match(var_19_0, "Skin (.+) | (.+) | (.+)")
							local var_19_4 = string.format("/pm %s Скин | ID: %s | %s | %s", var_8_0, var_8_1, "М", var_19_3)

							wait(50)
							sampSetChatInputText(var_19_4)
							sampSetChatInputEnabled(true)
						end)
					elseif var_8_1 == "40" or var_8_1 == "245" then
						lua_thread.create(function()
							local var_20_0 = "Skin 40 | Ж | 500.000(350.000 при /boostinfo)"
							local var_20_1, var_20_2, var_20_3 = string.match(var_20_0, "Skin (.+) | (.+) | (.+)")
							local var_20_4 = string.format("/pm %s Скин | ID: %s | %s | %s", var_8_0, var_8_1, "Ж", var_20_3)

							wait(50)
							sampSetChatInputText(var_20_4)
							sampSetChatInputEnabled(true)
						end)
					end
				elseif var_8_1 == "154" or var_8_1 == "84" or var_8_1 == "185" or var_8_1 == "166" or var_8_1 == "291" or var_8_1 == "255" or var_8_1 == "21" or var_8_1 == "42" or var_8_1 == "25" or var_8_1 == "188" or var_8_1 == "238" or var_8_1 == "192" or var_8_1 == "215" then
					if var_8_1 == "154" or var_8_1 == "84" or var_8_1 == "185" or var_8_1 == "166" or var_8_1 == "291" or var_8_1 == "255" or var_8_1 == "21" or var_8_1 == "42" or var_8_1 == "25" or var_8_1 == "188" then
						lua_thread.create(function()
							local var_21_0 = "Skin 238 | Ж | 1.000.000(700.000 при /boostinfo)"
							local var_21_1, var_21_2, var_21_3 = string.match(var_21_0, "Skin (.+) | (.+) | (.+)")
							local var_21_4 = string.format("/pm %s Скин | ID: %s | %s | %s", var_8_0, var_8_1, "М", var_21_3)

							wait(50)
							sampSetChatInputText(var_21_4)
							sampSetChatInputEnabled(true)
						end)
					elseif var_8_1 == "238" or var_8_1 == "192" or var_8_1 == "215" then
						lua_thread.create(function()
							local var_22_0 = "Skin 238 | Ж | 1.000.000(700.000 при /boostinfo)"
							local var_22_1, var_22_2, var_22_3 = string.match(var_22_0, "Skin (.+) | (.+) | (.+)")
							local var_22_4 = string.format("/pm %s Скин | ID: %s | %s | %s", var_8_0, var_8_1, "Ж", var_22_3)

							wait(50)
							sampSetChatInputText(var_22_4)
							sampSetChatInputEnabled(true)
						end)
					end
				elseif var_8_1 == "20" or var_8_1 == "28" or var_8_1 == "29" or var_8_1 == "142" or var_8_1 == "19" or var_8_1 == "177" or var_8_1 == "176" or var_8_1 == "180" or var_8_1 == "47" or var_8_1 == "48" or var_8_1 == "97" or var_8_1 == "4" or var_8_1 == "82" or var_8_1 == "250" or var_8_1 == "242" or var_8_1 == "227" or var_8_1 == "228" or var_8_1 == "121" or var_8_1 == "247" or var_8_1 == "117" or var_8_1 == "258" or var_8_1 == "259" or var_8_1 == "18" or var_8_1 == "45" or var_8_1 == "249" or var_8_1 == "83" or var_8_1 == "273" or var_8_1 == "123" or var_8_1 == "111" or var_8_1 == "124" or var_8_1 == "170" or var_8_1 == "12" or var_8_1 == "93" or var_8_1 == "172" or var_8_1 == "211" or var_8_1 == "224" or var_8_1 == "251" or var_8_1 == "233" then
					if var_8_1 == "20" or var_8_1 == "28" or var_8_1 == "29" or var_8_1 == "142" or var_8_1 == "19" or var_8_1 == "177" or var_8_1 == "176" or var_8_1 == "180" or var_8_1 == "47" or var_8_1 == "48" or var_8_1 == "97" or var_8_1 == "4" or var_8_1 == "82" or var_8_1 == "250" or var_8_1 == "242" or var_8_1 == "227" or var_8_1 == "228" or var_8_1 == "121" or var_8_1 == "247" or var_8_1 == "117" or var_8_1 == "258" or var_8_1 == "259" or var_8_1 == "18" or var_8_1 == "45" or var_8_1 == "249" or var_8_1 == "83" or var_8_1 == "273" or var_8_1 == "123" or var_8_1 == "111" or var_8_1 == "124" or var_8_1 == "170" then
						lua_thread.create(function()
							local var_23_0 = "Skin 20 | M | 2.000.000(1.400.000 при /boostinfo)"
							local var_23_1, var_23_2, var_23_3 = string.match(var_23_0, "Skin (.+) | (.+) | (.+)")
							local var_23_4 = string.format("/pm %s Скин | ID: %s | %s | %s", var_8_0, var_8_1, "М", var_23_3)

							wait(50)
							sampSetChatInputText(var_23_4)
							sampSetChatInputEnabled(true)
						end)
					elseif var_8_1 == "12" or var_8_1 == "93" or var_8_1 == "172" or var_8_1 == "211" or var_8_1 == "224" or var_8_1 == "251" or var_8_1 == "233" then
						lua_thread.create(function()
							local var_24_0 = "Skin 20 | M | 2.000.000(1.400.000 при /boostinfo)"
							local var_24_1, var_24_2, var_24_3 = string.match(var_24_0, "Skin (.+) | (.+) | (.+)")
							local var_24_4 = string.format("/pm %s Скин | ID: %s | %s | %s", var_8_0, var_8_1, "Ж", var_24_3)

							wait(50)
							sampSetChatInputText(var_24_4)
							sampSetChatInputEnabled(true)
						end)
					end
				elseif var_8_1 == "299" or var_8_1 == "119" or var_8_1 == "292" or var_8_1 == "293" or var_8_1 == "297" or var_8_1 == "296" or var_8_1 == "3" or var_8_1 == "289" or var_8_1 == "127" or var_8_1 == "118" or var_8_1 == "112" or var_8_1 == "152" or var_8_1 == "216" or var_8_1 == "219" or var_8_1 == "298" then
					if var_8_1 == "299" or var_8_1 == "119" or var_8_1 == "292" or var_8_1 == "293" or var_8_1 == "297" or var_8_1 == "296" or var_8_1 == "3" or var_8_1 == "289" or var_8_1 == "127" or var_8_1 == "118" or var_8_1 == "112" then
						lua_thread.create(function()
							local var_25_0 = "Skin 152 | Ж | 6.000.000(4.200.000 при /boostinfo)"
							local var_25_1, var_25_2, var_25_3 = string.match(var_25_0, "Skin (.+) | (.+) | (.+)")
							local var_25_4 = string.format("/pm %s Скин | ID: %s | %s | %s", var_8_0, var_8_1, "М", var_25_3)

							wait(50)
							sampSetChatInputText(var_25_4)
							sampSetChatInputEnabled(true)
						end)
					elseif var_8_1 == "152" or var_8_1 == "216" or var_8_1 == "219" or var_8_1 == "298" then
						lua_thread.create(function()
							local var_26_0 = "Skin 152 | Ж | 6.000.000(4.200.000 при /boostinfo)"
							local var_26_1, var_26_2, var_26_3 = string.match(var_26_0, "Skin (.+) | (.+) | (.+)")
							local var_26_4 = string.format("/pm %s Скин | ID: %s | %s | %s", var_8_0, var_8_1, "Ж", var_26_3)

							wait(50)
							sampSetChatInputText(var_26_4)
							sampSetChatInputEnabled(true)
						end)
					end
				elseif var_8_1 == "61" or var_8_1 == "5" or var_8_1 == "126" or var_8_1 == "290" or var_8_1 == "248" or var_8_1 == "223" or var_8_1 == "144" or var_8_1 == "208" or var_8_1 == "272" or var_8_1 == "261" or var_8_1 == "190" or var_8_1 == "237" or var_8_1 == "148" or var_8_1 == "263" then
					if var_8_1 == "61" or var_8_1 == "5" or var_8_1 == "126" or var_8_1 == "290" or var_8_1 == "248" or var_8_1 == "223" or var_8_1 == "144" or var_8_1 == "208" or var_8_1 == "272" or var_8_1 == "261" then
						lua_thread.create(function()
							local var_27_0 = "Skin 190 | Ж | 8.000.000(5.600.000 при /boostinfo)"
							local var_27_1, var_27_2, var_27_3 = string.match(var_27_0, "Skin (.+) | (.+) | (.+)")
							local var_27_4 = string.format("/pm %s Скин | ID: %s | %s | %s", var_8_0, var_8_1, "М", var_27_3)

							wait(50)
							sampSetChatInputText(var_27_4)
							sampSetChatInputEnabled(true)
						end)
					elseif var_8_1 == "190" or var_8_1 == "237" or var_8_1 == "148" or var_8_1 == "263" then
						lua_thread.create(function()
							local var_28_0 = "Skin 190 | Ж | 8.000.000(5.600.000 при /boostinfo)"
							local var_28_1, var_28_2, var_28_3 = string.match(var_28_0, "Skin (.+) | (.+) | (.+)")
							local var_28_4 = string.format("/pm %s Скин | ID: %s | %s | %s", var_8_0, var_8_1, "Ж", var_28_3)

							wait(50)
							sampSetChatInputText(var_28_4)
							sampSetChatInputEnabled(true)
						end)
					end
				elseif var_8_1 == "294" or var_8_1 == "295" or var_8_1 == "100" or var_8_1 == "46" or var_8_1 == "113" or var_8_1 == "125" or var_8_1 == "76" or var_8_1 == "91" or var_8_1 == "141" or var_8_1 == "150" or var_8_1 == "169" or var_8_1 == "214" then
					if var_8_1 == "294" or var_8_1 == "295" or var_8_1 == "100" or var_8_1 == "46" or var_8_1 == "113" or var_8_1 == "125" then
						lua_thread.create(function()
							local var_29_0 = "Skin 76 | Ж | 10.000.000(7.000.000 при /boostinfo)"
							local var_29_1, var_29_2, var_29_3 = string.match(var_29_0, "Skin (.+) | (.+) | (.+)")
							local var_29_4 = string.format("/pm %s Скин | ID: %s | %s | %s", var_8_0, var_8_1, "М", var_29_3)

							wait(50)
							sampSetChatInputText(var_29_4)
							sampSetChatInputEnabled(true)
						end)
					elseif var_8_1 == "76" or var_8_1 == "91" or var_8_1 == "141" or var_8_1 == "150" or var_8_1 == "169" or var_8_1 == "214" then
						lua_thread.create(function()
							local var_30_0 = "Skin 76 | Ж | 10.000.000(7.000.000 при /boostinfo)"
							local var_30_1, var_30_2, var_30_3 = string.match(var_30_0, "Skin (.+) | (.+) | (.+)")
							local var_30_4 = string.format("/pm %s Скин | ID: %s | %s | %s", var_8_0, var_8_1, "Ж", var_30_3)

							wait(50)
							sampSetChatInputText(var_30_4)
							sampSetChatInputEnabled(true)
						end)
					end
				elseif var_8_1 == "51" or var_8_1 == "52" or var_8_1 == "72" or var_8_1 == "94" or var_8_1 == "133" or var_8_1 == "206" or var_8_1 == "262" or var_8_1 == "85" or var_8_1 == "87" or var_8_1 == "138" or var_8_1 == "139" or var_8_1 == "244" or var_8_1 == "257" or var_8_1 == "256" then
					if var_8_1 == "51" or var_8_1 == "52" or var_8_1 == "72" or var_8_1 == "94" or var_8_1 == "133" or var_8_1 == "206" or var_8_1 == "262" then
						lua_thread.create(function()
							local var_31_0 = "Skin 85 | Ж | 20.000.000(14.000.000 при /boostinfo)"
							local var_31_1, var_31_2, var_31_3 = string.match(var_31_0, "Skin (.+) | (.+) | (.+)")
							local var_31_4 = string.format("/pm %s Скин | ID: %s | %s | %s", var_8_0, var_8_1, "М", var_31_3)

							wait(50)
							sampSetChatInputText(var_31_4)
							sampSetChatInputEnabled(true)
						end)
					elseif var_8_1 == "85" or var_8_1 == "87" or var_8_1 == "138" or var_8_1 == "139" or var_8_1 == "244" or var_8_1 == "257" or var_8_1 == "256" then
						lua_thread.create(function()
							local var_32_0 = "Skin 85 | Ж | 20.000.000(14.000.000 при /boostinfo)"
							local var_32_1, var_32_2, var_32_3 = string.match(var_32_0, "Skin (.+) | (.+) | (.+)")
							local var_32_4 = string.format("/pm %s Скин | ID: %s | %s | %s", var_8_0, var_8_1, "Ж", var_32_3)

							wait(50)
							sampSetChatInputText(var_32_4)
							sampSetChatInputEnabled(true)
						end)
					end
				end
			else
				sampAddChatMessage(" Скин '" .. var_8_1 .. "' не найден. Проверьте правильность написания!", -1)
			end
		else
			sampAddChatMessage(" /skinid [ID] [ID скина]", -1)
		end
	end)
	sampRegisterChatCommand("lasup", function()
		if var_0_88.activeokno_infoscreen_otvet_.v then
			local var_33_0 = io.open("moonloader\\config\\Support Helper\\pm.ini", "r")

			var_0_88.infoscreen_aHour = 0
			var_0_88.infoscreenaOtvet = 0
			var_0_88.infoscreenaRotvet = 0

			if var_33_0 ~= nil then
				for iter_33_0 in var_33_0:lines() do
					if string.find(iter_33_0, "%[(.+)|.+%] PayDay") and string.match(iter_33_0, "%[(.+)|.+%] PayDay") == os.date("%d.%m.%Y") then
						var_0_88.infoscreen_aHour = var_0_88.infoscreen_aHour + 1
					end

					if string.find(iter_33_0, "%[(.+)|.+%] .." .. var_0_76.tag.SupportName .. "%[%d+%] to .+%[%d+%]: .+") then
						local var_33_1, var_33_2 = string.match(iter_33_0, "%[(.+)|.+%] ..(" .. var_0_76.tag.SupportName .. "%[%d+%] to .+%[%d+%]: .+)")

						if var_33_1 == os.date("%d.%m.%Y") then
							var_0_88.infoscreenaOtvet = var_0_88.infoscreenaOtvet + 1
						end
					end

					if string.find(iter_33_0, "%[(.+)|.+%] OtvetReiting") and string.match(iter_33_0, "%[(.+)|.+%] OtvetReiting") == os.date("%d.%m.%Y") then
						var_0_88.infoscreenaRotvet = var_0_88.infoscreenaRotvet + 1
					end
				end

				io.close(var_33_0)
			end
		end
	end)
	sampRegisterChatCommand("asupotv", function()
		local var_34_0 = io.open("moonloader\\config\\Support Helper\\pm.ini", "r")
		local var_34_1 = {}
		local var_34_2 = {}
		local var_34_3 = {}
		local var_34_4 = {}
		local var_34_5 = ""
		local var_34_6 = 0
		local var_34_7 = 0
		local var_34_8 = 0

		if var_34_0 ~= nil then
			for iter_34_0 in var_34_0:lines() do
				if string.find(iter_34_0, "%[(.+)|.+%] PayDay") then
					local var_34_9 = string.match(iter_34_0, "%[(.+)|.+%] PayDay")

					if var_34_4[var_34_9] ~= nil then
						var_34_4[var_34_9] = var_34_4[var_34_9] + 1
					else
						var_34_4[var_34_9] = 1
					end

					var_34_6 = var_34_6 + 1
				end

				if string.find(iter_34_0, "%[(.+)|.+%] .." .. var_0_76.tag.SupportName .. "%[%d+%] to .+%[%d+%]: .+") then
					local var_34_10, var_34_11 = string.match(iter_34_0, "%[(.+)|.+%] ..(" .. var_0_76.tag.SupportName .. "%[%d+%] to .+%[%d+%]: .+)")

					if var_34_5 == var_34_10 then
						var_34_1[#var_34_1] = var_34_1[#var_34_1] + 1
					else
						var_34_5 = var_34_10
						var_34_1[#var_34_1 + 1] = 1
						var_34_2[#var_34_1] = var_34_10
					end

					var_34_7 = var_34_7 + 1
				end

				if string.find(iter_34_0, "%[(.+)|.+%] OtvetReiting") then
					local var_34_12 = string.match(iter_34_0, "%[(.+)|.+%] OtvetReiting")

					if var_34_3[var_34_12] ~= nil then
						var_34_3[var_34_12] = var_34_3[var_34_12] + 1
					else
						var_34_3[var_34_12] = 1
					end

					var_34_8 = var_34_8 + 1
				end
			end

			io.close(var_34_0)
		end

		DialogText = ""

		for iter_34_1, iter_34_2 in pairs(var_34_1) do
			if var_34_4[var_34_2[iter_34_1]] == nil then
				var_34_4[var_34_2[iter_34_1]] = 0
			end

			if var_34_3[var_34_2[iter_34_1]] == nil then
				var_34_3[var_34_2[iter_34_1]] = 0
			end

			DialogText = string.format("%s\t%s / %s\t%s\t%s\n%s", var_34_2[iter_34_1], var_34_1[iter_34_1], var_34_3[var_34_2[iter_34_1]], var_34_4[var_34_2[iter_34_1]], var_34_4[var_34_2[iter_34_1]] * 30000, DialogText)
		end

		DialogText = "Дата\tОтветы / Отв.(!)\tPayDay\tЗарплата\n" .. DialogText .. "\nВсего:\t" .. var_34_7 .. " / " .. var_34_8 .. "\t" .. var_34_6 .. "\t" .. var_34_6 * 30000 .. "\nОтветы(w): \t" .. var_0_77.Weekset.online .. " / " .. var_0_77.Weekset.onlinereting

		sampShowDialog(8228, "Support Helper | Samp-RP", DialogText, "Выбрать", "Назад", 5)
	end)
	sampRegisterChatCommand("shelper", function()
		var_0_88.imgui_active3.v = not var_0_88.imgui_active3.v
	end)
	lua_thread.create(function()
		antiflood_get_text = os.clock() * 1000
		chatinput_text = ""

		while true do
			wait(0)

			local var_36_0 = var_0_76.pos.x
			local var_36_1 = var_0_76.pos.y
			local var_36_2, var_36_3 = sampGetPlayerIdByCharHandle(PLAYER_PED)

			nickname = sampGetPlayerNickname(var_36_3)

			if sampGetPlayerScore(var_36_3) == 0 then
				var_0_41 = false
			end

			score = sampGetPlayerScore(var_36_3)

			if not var_0_41 and score ~= 0 and var_0_76.tag.SupportName == nickname and var_0_42 == 0 and var_0_76.tag.activeAutoSduty then
				var_0_42 = 1
			end

			if var_0_76.tag.active6 and var_0_76.tag.SupportName == nickname then
				if os.clock() * 1000 - antiflood_get_text > 300 then
					antiflood_get_text = os.clock() * 1000
					chatinput_text = sampGetChatInputText()
				end

				if sampIsChatInputActive() and string.find(chatinput_text, "%/pm (%d+)") then
					local var_36_4 = string.match(chatinput_text, "%/pm (%d+).+")

					if var_0_44[var_36_4] ~= nil then
						if var_0_58 ~= "" then
							ask = var_0_58
						else
							ask = var_0_44[var_36_4]
						end

						renderFontDrawText(font2, "{" .. var_0_76.tag.color .. "}" .. ask, var_36_0, var_36_1, -1)
					end
				else
					var_0_58 = ""
				end
			end
		end
	end)

	while true do
		wait(0)
		doWindow()
		doDialog()

		ms = math.ceil(os.clock() * 1000 - var_0_56)

		if ms > 1800 and var_0_42 == 1 then
			var_0_42 = 2

			sampSendChat("/sduty")
		end

		if ms > 1000 and var_0_59 == 1 then
			var_0_59 = 2

			sampSendChat("/mrating")
		end

		if ms > 1100 and var_0_51 == 2 and #var_0_52 > 0 then
			var_0_51 = 0

			sampSetChatInputText("/pm " .. var_0_50 .. var_0_52)
			sampSetChatInputEnabled(true)

			var_0_52 = ""
		end

		if wasKeyPressed(var_0_2[var_0_76.tag.KeyPMLast]) and var_0_45 ~= -1 then
			var_0_55[var_0_46[#var_0_46]] = 1

			sampSetChatInputText("/pm " .. var_0_45 .. " ")
			sampSetChatInputEnabled(true)
		end

		if editingPos and var_0_88.active6.v then
			showCursor(true)
			renderFontDrawText(font, "{" .. var_0_76.tag.color .. "}" .. "Как поднять бабла?", var_0_80, var_0_81, -1)

			curX, curY = getCursorPos()
			var_0_80, var_0_81 = curX, curY

			if wasKeyPressed(32) then
				sampAddChatMessage(var_0_13 .. " {FFFFFF}Новое положение {FFA500}сохранено{FFFFFF}: {FFE4B5}Х: {00BFFF}" .. curX .. "{FFFFFF}, {FFE4B5}Y: {00BFFF}" .. curY, 16776960)

				editingPos = false

				save()
				showCursor(false)

				var_0_88.imgui_active3.v = true
			end
		end

		if not editingPosP3 and var_0_88.activeokno_infoscreen_otvet_.v then
			local var_6_6 = var_0_76.posT2.xx
			local var_6_7 = var_0_76.posT2.yy
			local var_6_8 = "Сегодняшняя дата: " .. os.date("%d.%m.%Y") .. "\nОтветы / Отв.(!): " .. var_0_88.infoscreenaOtvet .. " / " .. var_0_88.infoscreenaRotvet .. "\nPayDay: " .. var_0_88.infoscreen_aHour .. "\nЗарплата: " .. var_0_88.infoscreen_aHour * 30000

			renderFontDrawText(font3, "{" .. var_0_76.tag.color .. "}" .. var_6_8, var_6_6, var_6_7, -1)
		end

		if editingPosP and var_0_88.active5.v then
			showCursor(true)

			local var_6_9 = 0
			local var_6_10 = 4294967295

			if #var_0_46 == 0 then
				local var_6_11 = "Здесь будет отображаться окно с вопросами"
				local var_6_12 = 4294967295

				renderDrawBox(var_0_82, var_0_83, renderGetFontDrawTextLength(font1, var_6_11) + 5, renderGetFontDrawHeight(font1) + (var_6_9 == 0 and 5 or 0), 1342177280)
				renderFontDrawText(font1, var_6_11, var_0_82, var_0_83, var_6_12)
			end

			for iter_6_6 = var_0_48 == 0 and #var_0_46 or #var_0_46 - var_0_48, var_0_48 == 0 and #var_0_46 - var_0_76.tag.global_Line - var_0_48 + 1 or #var_0_46 - var_0_76.tag.global_Line - var_0_48 - var_0_48 + 1, -1 do
				if var_0_46[iter_6_6] ~= nil then
					local var_6_13, var_6_14 = string.match(var_0_46[iter_6_6], "Вопрос .+%[(%d+)%]<%d+lvl>: (.+)")
					local var_6_15 = (" " or " ") .. "[" .. var_6_9 .. "] " .. var_0_46[iter_6_6]

					if #var_0_53 < #var_6_15 then
						var_0_53 = var_6_15
					end

					if var_0_55[var_0_46[iter_6_6]] ~= nil then
						color = 4278229248
					else
						color = 4294967295
					end

					renderDrawBox(var_0_82, var_0_83, renderGetFontDrawTextLength(font1, var_0_53) + 5, renderGetFontDrawHeight(font1) + (var_6_9 == 0 and 5 or 0), 1342177280)
					renderFontDrawText(font1, var_6_15, var_0_82, var_0_83, color)

					local var_6_16 = renderGetFontDrawHeight(font1)

					var_0_83 = var_0_83 - var_6_16
					var_6_9 = var_6_9 + 1
				end
			end

			curXX, curYY = getCursorPos()
			var_0_82, var_0_83 = curXX, curYY

			if wasKeyPressed(32) then
				sampAddChatMessage(var_0_13 .. " {FFFFFF}Новое положение {FFA500}сохранено{FFFFFF}: {FFE4B5}Х: {00BFFF}" .. curXX .. "{FFFFFF}, {FFE4B5}Y: {00BFFF}" .. curYY, 16776960)

				editingPosP = false

				savee()
				showCursor(false)

				var_0_88.imgui_active3.v = true
			end
		end

		if editingPosP2 and var_0_88.activerenderchatsupports.v then
			showCursor(true)

			local var_6_17 = 0

			if #var_0_47 == 0 then
				local var_6_18 = "Здесь будет отображаться выведенный чат игровых помощников"
				local var_6_19 = 4294967295

				renderDrawBox(var_0_84, var_0_85, renderGetFontDrawTextLength(font1, var_6_18) + 5, renderGetFontDrawHeight(font1) + (var_6_17 == 0 and 5 or 0), 1342177280)
				renderFontDrawText(font1, var_6_18, var_0_84, var_0_85, var_6_19)
			end

			for iter_6_7 = var_0_49 == 0 and #var_0_47 or #var_0_47 - var_0_49, var_0_49 == 0 and #var_0_47 - var_0_76.tag.global_Line2 - var_0_49 + 1 or #var_0_47 - var_0_76.tag.global_Line2 - var_0_49 - var_0_49 + 1, -1 do
				if var_0_47[iter_6_7] ~= nil then
					local var_6_20 = "" .. var_0_47[iter_6_7]

					if #var_0_54 < #var_6_20 then
						var_0_54 = var_6_20
					end

					local var_6_21 = 4294967295

					renderDrawBox(var_0_84, var_0_85, renderGetFontDrawTextLength(font1, var_0_54) + 5, renderGetFontDrawHeight(font1) + (var_6_17 == 0 and 5 or 0), 1342177280)
					renderFontDrawText(font1, var_6_20, var_0_84, var_0_85, var_6_21)

					local var_6_22 = renderGetFontDrawHeight(font1)

					var_0_85 = var_0_85 - var_6_22
					var_6_17 = var_6_17 + 1
				end
			end

			curXX1, curYY1 = getCursorPos()
			var_0_84, var_0_85 = curXX1, curYY1

			if wasKeyPressed(32) then
				sampAddChatMessage(var_0_13 .. " {FFFFFF}Новое положение {FFA500}сохранено{FFFFFF}: {FFE4B5}Х: {00BFFF}" .. curXX1 .. "{FFFFFF}, {FFE4B5}Y: {00BFFF}" .. curYY1, 16776960)

				editingPosP2 = false

				savee2()
				showCursor(false)

				var_0_88.imgui_active3.v = true
			end
		end

		if editingPosP3 and var_0_88.activeokno_infoscreen_otvet_.v then
			showCursor(true)

			local var_6_23 = "Сегодняшняя дата: " .. os.date("%d.%m.%Y") .. "\nОтветы / Отв.(!): " .. var_0_88.infoscreenaOtvet .. "/" .. var_0_88.infoscreenaRotvet .. "\nPayDay: " .. var_0_88.infoscreen_aHour .. "\nЗарплата:" .. var_0_88.infoscreen_aHour * 30000

			renderFontDrawText(font3, "{" .. var_0_76.tag.color .. "}" .. var_6_23, var_0_86, var_0_87, -1)

			curXX2, curYY2 = getCursorPos()
			var_0_86, var_0_87 = curXX2, curYY2

			if wasKeyPressed(32) then
				sampAddChatMessage(var_0_13 .. " {FFFFFF}Новое положение {FFA500}сохранено{FFFFFF}: {FFE4B5}Х: {00BFFF}" .. curXX2 .. "{FFFFFF}, {FFE4B5}Y: {00BFFF}" .. curYY2, 16776960)

				editingPosP3 = false

				savee3()
				showCursor(false)

				var_0_88.imgui_active3.v = true
			end
		end

		local var_6_24, var_6_25, var_6_26, var_6_27 = sampHasDialogRespond(8888)

		if var_6_24 then
			if var_6_25 == 1 then
				wait(150)

				var_0_88.imgui_active3.v = not var_0_88.imgui_active3.v
			else
				wait(150)

				var_0_88.imgui_active3.v = not var_0_88.imgui_active3.v
			end
		end

		if var_0_76.onWeek.week ~= number_week() then
			var_0_76.onWeek.week = number_week()
			var_0_76.onWeek.online = 0

			for iter_6_8, iter_6_9 in pairs(var_0_76.myWeekOnline) do
				iter_6_9 = 0
			end

			var_0_76.myWeekOnline[0] = 0
			var_0_76.myWeekOnline[1] = 0
			var_0_76.myWeekOnline[2] = 0
			var_0_76.myWeekOnline[3] = 0
			var_0_76.myWeekOnline[4] = 0
			var_0_76.myWeekOnline[5] = 0
			var_0_76.myWeekOnline[6] = 0

			var_0_1.save(var_0_76, "Support Helper\\SH-settings.ini")
		end

		if var_0_76.onDay.today ~= os.date("%a") then
			var_0_76.onDay.today = os.date("%a")
			var_0_76.onDay.online = 0

			var_0_1.save(var_0_76, "Support Helper\\SH-settings.ini")
		end

		if var_0_77.Weekset.week ~= number_week() then
			var_0_77.Weekset.week = number_week()
			var_0_77.Weekset.online = 0
			var_0_77.Weekset.onlinereting = 0

			var_0_1.save(var_0_77, "Support Helper\\pm-settings.ini")
		end

		if sampIsChatInputActive() and not string.find(sampGetChatInputText(), "(.+) /sgps (%d+) (.+)") and not string.find(sampGetChatInputText(), "(.+) sgps/ (%d+) (.+)") and string.find(sampGetChatInputText(), "/sgps (%d+) (.+)") then
			if string.find(sampGetChatInputText(), "/sgps (%d+) (.+) ") then
				var_0_88.window_12.v = false
			else
				var_0_88.window_12.v = true
			end
		else
			var_0_88.window_12.v = false
		end

		var_0_6.Process = var_0_88.imgui_active.v or var_0_88.imgui_active2.v or var_0_88.imgui_active3.v or var_0_88.imgui_active4.v or var_0_88.imgui_active5.v or var_0_88.window_12.v
	end
end

function convertDataToString(arg_37_0)
	local var_37_0 = arg_37_0

	if arg_37_0:find("%d+%.%d+%.%d+") then
		local var_37_1, var_37_2, var_37_3 = arg_37_0:find("(%d+)%.(%d+)%.(%d+)")

		var_37_0 = tonumber(string.format("%d%d%d", var_37_3, var_37_2, var_37_1))
	end

	return var_37_0
end

function doDialog()
	if sampGetDialogCaption() == "Поиск лидеров" then
		local var_38_0, var_38_1, var_38_2, var_38_3 = sampHasDialogRespond(2256)

		if var_38_0 and var_38_1 == 1 and dliaders ~= nil and dliaders[var_38_2 + 1] ~= nil then
			wait(50)
			sampSetChatInputText("/pm " .. sleadersID .. dliaders[var_38_2 + 1])
			sampSetChatInputEnabled(true)
		end
	end
end

function doWindow()
	if not editingPosP and wasKeyPressed(var_0_2[var_0_76.tag.Keyokno]) then
		var_0_88.active5.v = not var_0_88.active5.v
		var_0_76.tag.active5 = var_0_88.active5.v

		savesettings()
	end

	if var_0_88.active5.v and not sampIsScoreboardOpen() and sampIsChatVisible() and not sampIsDialogActive() and not isKeyDown(116) and not isKeyDown(121) and not editingPosP then
		local var_39_0 = var_0_76.posT.xx
		local var_39_1 = var_0_76.posT.yy

		if isKeyDown(var_0_2[var_0_76.tag.KeyWindowPM]) then
			local var_39_2 = getMousewheelDelta()

			if var_39_2 > 0 then
				var_0_48 = var_0_48 + 1
			elseif var_39_2 < 0 and var_0_48 > 0 then
				var_0_48 = var_0_48 - 1
			end
		end

		local var_39_3 = 0
		local var_39_4 = 4294967295

		if #var_0_46 == 0 then
			local var_39_5 = "Здесь будет отображаться окно с вопросами"
			local var_39_6 = 4294967295

			renderDrawBox(var_39_0, var_39_1, renderGetFontDrawTextLength(font1, var_39_5) + 5, renderGetFontDrawHeight(font1) + (var_39_3 == 0 and 5 or 0), 1342177280)
			renderFontDrawText(font1, var_39_5, var_39_0, var_39_1, var_39_6)
		end

		for iter_39_0 = var_0_48 == 0 and #var_0_46 or #var_0_46 - var_0_48, var_0_48 == 0 and #var_0_46 - var_0_76.tag.global_Line - var_0_48 + 1 or #var_0_46 - var_0_76.tag.global_Line - var_0_48 - var_0_48 + 1, -1 do
			if var_0_46[iter_39_0] ~= nil then
				local var_39_7, var_39_8 = string.match(var_0_46[iter_39_0], "Вопрос .+%[(%d+)%]<%d+lvl>: (.+)")
				local var_39_9 = (" " or " ") .. "[" .. var_39_3 .. "] " .. var_0_46[iter_39_0]

				if #var_0_53 < #var_39_9 then
					var_0_53 = var_39_9
				end

				if (wasKeyPressed(var_0_2["VK_" .. var_39_3]) or wasKeyPressed(var_0_2["VK_NUMPAD" .. var_39_3])) and isKeyDown(var_0_2[var_0_76.tag.KeyWindowPM]) then
					var_0_58 = var_39_8

					sampSetChatInputText("/pm " .. var_39_7 .. " ")
					sampSetChatInputEnabled(true)

					var_0_55[var_0_46[iter_39_0]] = 1
				end

				if var_0_55[var_0_46[iter_39_0]] ~= nil then
					color = 4278229248
				else
					color = 4294967295
				end

				renderDrawBox(var_39_0, var_39_1, renderGetFontDrawTextLength(font1, var_0_53) + 5, renderGetFontDrawHeight(font1) + (var_39_3 == 0 and 5 or 0), 1342177280)
				renderFontDrawText(font1, var_39_9, var_39_0, var_39_1, color)

				var_39_1 = var_39_1 - renderGetFontDrawHeight(font1)
				var_39_3 = var_39_3 + 1
			end
		end
	end

	if var_0_88.activerenderchatsupports.v and not sampIsScoreboardOpen() and sampIsChatVisible() and not sampIsDialogActive() and not isKeyDown(116) and not isKeyDown(121) and not editingPosP2 then
		local var_39_10 = var_0_76.posT1.xx
		local var_39_11 = var_0_76.posT1.yy

		if isKeyDown(var_0_2[var_0_76.tag.keyrenderchatsupports]) then
			local var_39_12 = getMousewheelDelta()

			if var_39_12 > 0 then
				var_0_49 = var_0_49 + 1
			elseif var_39_12 < 0 and var_0_49 > 0 then
				var_0_49 = var_0_49 - 1
			end
		end

		local var_39_13 = 0

		if #var_0_47 == 0 then
			local var_39_14 = 4294967295
			local var_39_15 = "Здесь будет отображаться выведенный чат игровых помощников"

			renderDrawBox(var_39_10, var_39_11, renderGetFontDrawTextLength(font1, var_39_15) + 5, renderGetFontDrawHeight(font1) + (var_39_13 == 0 and 5 or 0), 1342177280)
			renderFontDrawText(font1, var_39_15, var_39_10, var_39_11, var_39_14)
		end

		for iter_39_1 = var_0_49 == 0 and #var_0_47 or #var_0_47 - var_0_49, var_0_49 == 0 and #var_0_47 - var_0_76.tag.global_Line2 - var_0_49 + 1 or #var_0_47 - var_0_76.tag.global_Line2 - var_0_49 - var_0_49 + 1, -1 do
			if var_0_47[iter_39_1] ~= nil then
				local var_39_16 = "" .. var_0_47[iter_39_1]

				if #var_0_54 < #var_39_16 then
					var_0_54 = var_39_16
				end

				local var_39_17 = 4294967295

				renderDrawBox(var_39_10, var_39_11, renderGetFontDrawTextLength(font1, var_0_54) + 5, renderGetFontDrawHeight(font1) + (var_39_13 == 0 and 5 or 0), 1342177280)
				renderFontDrawText(font1, var_39_16, var_39_10, var_39_11, var_39_17)

				var_39_11 = var_39_11 - renderGetFontDrawHeight(font1)
				var_39_13 = var_39_13 + 1
			end
		end
	end
end

function onWindowMessage(arg_40_0, arg_40_1, arg_40_2)
	if (arg_40_0 == 256 or arg_40_0 == 257) and arg_40_1 == var_0_2.VK_ESCAPE and (var_0_88.imgui_active.v or var_0_88.imgui_active2.v or var_0_88.imgui_active3.v or var_0_88.imgui_active4.v or var_0_88.imgui_active5.v) and not isPauseMenuActive() then
		consumeWindowMessage(true, false)

		if arg_40_0 == 257 then
			if var_0_88.imgui_active.v then
				var_0_88.imgui_active.v = false
			else
				var_0_88.imgui_active.v = false
			end

			if var_0_88.imgui_active2.v then
				var_0_88.imgui_active2.v = false
			else
				var_0_88.imgui_active2.v = false
			end

			if var_0_88.imgui_active3.v then
				var_0_88.imgui_active3.v = false
			else
				var_0_88.imgui_active3.v = false
			end

			if var_0_88.imgui_active4.v then
				var_0_88.imgui_active4.v = false
				var_0_88.imgui_active3.v = true
			else
				var_0_88.imgui_active3.v = false
			end

			if var_0_88.imgui_active5.v then
				var_0_88.imgui_active5.v = false
				var_0_88.imgui_active3.v = true
			else
				var_0_88.imgui_active3.v = false
			end
		end
	end

	if (arg_40_0 == 256 or arg_40_0 == 260) and sampIsChatInputActive() and not string.find(sampGetChatInputText(), "(.+) /sgps (%d+) (.+)") and not string.find(sampGetChatInputText(), "(.+) sgps/ (%d+) (.+)") and string.find(sampGetChatInputText(), "/sgps (%d+) (.+)") then
		var_0_65 = {}

		local var_40_0, var_40_1 = string.match(sampGetChatInputText(), "/sgps (%d+) (.+)")

		if var_40_1 ~= nil then
			for iter_40_0 = 1, #var_0_70 do
				if string.rlower(var_0_70[iter_40_0]):find(string.rlower(var_40_1)) then
					table.insert(var_0_65, #var_0_65 + 1, u8(var_0_70[iter_40_0]))
				end
			end
		end
	end
end

function var_0_5.onServerMessage(arg_41_0, arg_41_1)
	
if arg_41_1 == " Вы не саппорт" then
		var_0_88.activeAutoSduty.v = false
		var_0_76.tag.activeAutoSduty = false

		savesettings()
		sampAddChatMessage(var_0_13 .. " {FFFFFF}Автоматическое начало рабочего дня {FF0000}отключен", 16776960)

		var_0_42 = 0
	end

	if arg_41_1 == " Рабочий день начат" and var_0_43 then
		if var_0_42 == 2 then
			var_0_42 = 0
		end

		var_0_41 = true
		var_0_43 = false

		savesettings()
	end

	if arg_41_1 == " Рабочий день закончен" and var_0_43 then
		if var_0_42 == 2 then
			var_0_42 = 1
		end
		if var_0_88.aifaqsystem.v then
	print(arg_41_1)
end
if var_0_88.aifaqsystem.v then

	if arg_41_1:find("Вопрос") then

		local id = arg_41_1:match("%[(%d+)%]")
		local question = arg_41_1:match(":%s(.+)")

		if id and question then

			id = tonumber(id)

			pendingQuestions[id] = question

			sampAddChatMessage(
				"{FFFF00}Support Helper |  Вопрос сохранен!",
				-1
			)
		end
	end

	if arg_41_1:find(" to ") then

		local playerId = arg_41_1:match("to%s+.+%[(%d+)%]")
		local answer = arg_41_1:match(":%s(.+)")

		if playerId and answer then

			playerId = tonumber(playerId)

			if pendingQuestions[playerId] then

				table.insert(faqDatabase, {
					question = pendingQuestions[playerId],
					answer = answer
				})

				saveFaqDatabase()

				sampAddChatMessage(
					"{FFFF00}Support Helper |  Ответ сохранен!",
					-1
				)

				pendingQuestions[playerId] = nil
			end
		end
	end
end

		var_0_41 = false
		var_0_43 = false
	end

	if arg_41_1 == " Не флуди!" and var_0_42 == 2 then
		var_0_42 = 1
	end
	if var_0_88.aifaqsystem.v then
	-- sampAddChatMessage("[AI DEBUG] " .. arg_41_1, -1) дебаг обработки серверных сообщении
end

	if string.find(arg_41_1, "..Вопрос .+%[(%d+)%].+") and not arg_41_1:find("(.+) ..Вопрос .+%[(%d+)%].+") then
		local var_41_0, var_41_1 = string.match(arg_41_1, "..Вопрос .+%[(%d+)%]<%d+lvl>: (.+)")

		var_0_45 = var_41_0
		var_0_44[var_0_45] = var_41_1
		var_0_46[#var_0_46 + 1] = "[" .. os.date("%X", os.time()) .. "] " .. arg_41_1
		var_0_57[#var_0_46] = var_0_45
		if var_0_88.aifaqsystem.v then

	local questionId = tonumber(var_41_0)
	local questionText = tostring(var_41_1)

	pendingQuestions[questionId] = questionText

	local foundAnswer = findSimilarAnswer(questionText)

	if foundAnswer then

		sampAddChatMessage(
			"{FFFF00}Support Helper |  Найден ответ: " .. foundAnswer,
			-1
		)
	end

	sampAddChatMessage(
		"{FFFF00}Support Helper | {ffffff}Вопрос сохранен!",
		-1
	)

			pendingQuestions[playerId] = nil
		end
	end
	
	if string.match(arg_41_1, "...+%[.+%] to .+%[(%d+)%]: (.+)") and not arg_41_1:match("(.+) ...+%[.+%] to .+%[(%d+)%]: (.+)") and var_0_88.active3.v and not arg_41_1:find(var_0_76.tag.SupportName) then
		return false
	end

	if string.find(arg_41_1, "===============%[(%d+):(%d+)%]===============") and var_0_41 then
		lua_thread.create(function()
			local var_42_0 = io.open("moonloader\\config\\Support Helper\\pm.ini", "a")

			var_42_0:write("[" .. os.date("%d.%m.%Y") .. "|" .. os.date("%X", os.time()) .. "] PayDay\n")
			var_42_0:flush()
			io.close(var_42_0)
		end)
	end

	if string.find(arg_41_1, "Вы ответили на вопрос из списка. Вопрос ниже удален") and arg_41_0 == 1790050303 then
		lua_thread.create(function()
			local var_43_0 = io.open("moonloader\\config\\Support Helper\\pm.ini", "a")

			var_43_0:write("[" .. os.date("%d.%m.%Y") .. "|" .. os.date("%X", os.time()) .. "] OtvetReiting\n")
			var_43_0:flush()
			io.close(var_43_0)

			var_0_77.Weekset.onlinereting = var_0_77.Weekset.onlinereting + 1

			var_0_1.save(var_0_77, "Support Helper\\pm-settings.ini")
		end)
	end

	if var_0_76.tag.SupportName ~= nil and string.find(arg_41_1, ".." .. var_0_76.tag.SupportName .. "%[.+%] to .+%[(%d+)%]: (.+)") and not arg_41_1:find("(.+) .." .. var_0_76.tag.SupportName .. "%[.+%] to .+%[(%d+)%]: (.+)") then
		lua_thread.create(function(arg_44_0)
			local var_44_0 = io.open("moonloader\\config\\Support Helper\\pm.ini", "a")

			var_44_0:write("[" .. os.date("%d.%m.%Y") .. "|" .. os.date("%X", os.time()) .. "] " .. arg_44_0 .. "\n")
			var_44_0:flush()
			io.close(var_44_0)

			var_0_77.Weekset.online = var_0_77.Weekset.online + 1

			var_0_1.save(var_0_77, "Support Helper\\pm-settings.ini")
		end, arg_41_1)
	end

	if string.find(arg_41_1, " Дом: .+ | Класс: .+ | Цена: .+ вирт") and var_0_51 == 1 then
		var_0_52 = arg_41_1
		var_0_51 = 2
	end

	if arg_41_1 == " Вы не таксист или не на службе" then
		sfarmID = nil
	end

	if var_0_76.tag.activesupcolor and not var_0_76.tag.activechatsup and not var_0_76.tag.activerenderchatsupports and arg_41_1:find(" <SUPPORT(-)CHAT> (%a+_%a+):(.*)") and not arg_41_1:find("(.+) <SUPPORT(-)CHAT> (%a+_%a+):(.*)") then
		local var_41_2 = "0x" .. var_0_76.tag.supchatcolor .. "AA"

		return {
			var_41_2,
			arg_41_1
		}
	end

	if var_0_76.tag.activesupcolor and var_0_76.tag.activechatsup and not var_0_76.tag.activerenderchatsupports and arg_41_1:find(" <SUPPORT(-)CHAT> (%a+_%a+):(.*)") and not arg_41_1:find("(.+) <SUPPORT(-)CHAT> (%a+_%a+):(.*)") then
		local var_41_3, var_41_4, var_41_5 = arg_41_1:match("<SUPPORT(-)CHAT> (%a+_%a+):(.*)")
		local var_41_6 = sampGetPlayerIdByNickname(var_41_4)
		local var_41_7 = "<SUPPORT-CHAT> " .. var_41_4 .. "[" .. var_41_6 .. "]:" .. var_41_5
		local var_41_8 = "0x" .. var_0_76.tag.supchatcolor .. "AA"

		return {
			var_41_8,
			var_41_7
		}
	end

	if not var_0_76.tag.activesupcolor and var_0_76.tag.activechatsup and not var_0_76.tag.activerenderchatsupports and arg_41_1:find(" <SUPPORT(-)CHAT> (%a+_%a+):(.*)") and not arg_41_1:find("(.+) <SUPPORT(-)CHAT> (%a+_%a+):(.*)") then
		local var_41_9, var_41_10, var_41_11 = arg_41_1:match("<SUPPORT(-)CHAT> (%a+_%a+):(.*)")
		local var_41_12 = sampGetPlayerIdByNickname(var_41_10)
		local var_41_13 = "<SUPPORT-CHAT> " .. var_41_10 .. "[" .. var_41_12 .. "]:" .. var_41_11

		return {
			arg_41_0,
			var_41_13
		}
	end

	if var_0_76.tag.activerenderchatsupports and var_0_76.tag.activesupcolor and not var_0_76.tag.activechatsup and arg_41_1:find(" <SUPPORT(-)CHAT> (%a+_%a+):(.*)") and not arg_41_1:find("(.+) <SUPPORT(-)CHAT> (%a+_%a+):(.*)") then
		var_0_47[#var_0_47 + 1] = "[" .. os.date("%X", os.time()) .. "] " .. arg_41_1

		if var_0_76.tag.activeclearchatsupports then
			return false
		else
			local var_41_14 = "0x" .. var_0_76.tag.supchatcolor .. "AA"

			return {
				var_41_14,
				arg_41_1
			}
		end
	end

	if var_0_76.tag.activerenderchatsupports and var_0_76.tag.activechatsup and var_0_76.tag.activesupcolor and arg_41_1:find(" <SUPPORT(-)CHAT> (%a+_%a+):(.*)") and not arg_41_1:find("(.+) <SUPPORT(-)CHAT> (%a+_%a+):(.*)") then
		local var_41_15, var_41_16, var_41_17 = arg_41_1:match("<SUPPORT(-)CHAT> (%a+_%a+):(.*)")
		local var_41_18 = sampGetPlayerIdByNickname(var_41_16)
		local var_41_19 = "<SUPPORT-CHAT> " .. var_41_16 .. "[" .. var_41_18 .. "]:" .. var_41_17

		var_0_47[#var_0_47 + 1] = "[" .. os.date("%X", os.time()) .. "] " .. var_41_19

		if var_0_76.tag.activeclearchatsupports then
			return false
		else
			local var_41_20, var_41_21, var_41_22 = arg_41_1:match("<SUPPORT(-)CHAT> (%a+_%a+):(.*)")
			local var_41_23 = sampGetPlayerIdByNickname(var_41_21)
			local var_41_24 = "<SUPPORT-CHAT> " .. var_41_21 .. "[" .. var_41_23 .. "]:" .. var_41_22
			local var_41_25 = "0x" .. var_0_76.tag.supchatcolor .. "AA"

			return {
				var_41_25,
				var_41_24
			}
		end
	end

	if var_0_76.tag.activerenderchatsupports and var_0_76.tag.activechatsup and not var_0_76.tag.activesupcolor and arg_41_1:find(" <SUPPORT(-)CHAT> (%a+_%a+):(.*)") and not arg_41_1:find("(.+) <SUPPORT(-)CHAT> (%a+_%a+):(.*)") then
		local var_41_26, var_41_27, var_41_28 = arg_41_1:match("<SUPPORT(-)CHAT> (%a+_%a+):(.*)")
		local var_41_29 = sampGetPlayerIdByNickname(var_41_27)
		local var_41_30 = "<SUPPORT-CHAT> " .. var_41_27 .. "[" .. var_41_29 .. "]:" .. var_41_28

		var_0_47[#var_0_47 + 1] = "[" .. os.date("%X", os.time()) .. "] " .. var_41_30

		if var_0_76.tag.activeclearchatsupports then
			return false
		else
			local var_41_31, var_41_32, var_41_33 = arg_41_1:match("<SUPPORT(-)CHAT> (%a+_%a+):(.*)")
			local var_41_34 = sampGetPlayerIdByNickname(var_41_32)
			local var_41_35 = "<SUPPORT-CHAT> " .. var_41_32 .. "[" .. var_41_34 .. "]:" .. var_41_33

			return {
				arg_41_0,
				var_41_35
			}
		end
	end

	if var_0_76.tag.activerenderchatsupports and not var_0_76.tag.activesupcolor and not var_0_76.tag.activechatsup and arg_41_1:find(" <SUPPORT(-)CHAT> (%a+_%a+):(.*)") and not arg_41_1:find("(.+) <SUPPORT(-)CHAT> (%a+_%a+):(.*)") then
		var_0_47[#var_0_47 + 1] = "[" .. os.date("%X", os.time()) .. "] " .. arg_41_1

		if var_0_76.tag.activeclearchatsupports then
			return false
		else
			return {
				arg_41_0,
				arg_41_1
			}
		end
	end

	if var_0_76.tag.activevop and arg_41_1:find("..Вопрос .+%[(%d+)%].+") and not arg_41_1:find("(.+) ..Вопрос .+%[(%d+)%].+") then
		local var_41_36 = "0x" .. var_0_76.tag.vopchatcolor .. "AA"

		return {
			var_41_36,
			arg_41_1
		}
	end

	if var_0_76.tag.activeotvetcolor and arg_41_1:find("...+%[.+%] to .+%[(%d+)%].+") and not arg_41_1:find(var_0_76.tag.SupportName) and not arg_41_1:find("(.+) ...+%[.+%] to .+%[(%d+)%].+") then
		local var_41_37 = "0x" .. var_0_76.tag.otvetcolor .. "AA"

		return {
			var_41_37,
			arg_41_1
		}
	end

	if var_0_76.tag.activemyotvetcolor and var_0_76.tag.SupportName ~= nil and string.find(arg_41_1, ".." .. var_0_76.tag.SupportName .. "%[.+%] to .+%[(%d+)%]: (.+)") and not arg_41_1:find("(.+) .." .. var_0_76.tag.SupportName .. "%[.+%] to .+%[(%d+)%]: (.+)") then
		local var_41_38 = "0x" .. var_0_76.tag.myotvetcolor .. "AA"

		return {
			var_41_38,
			arg_41_1
		}
	end
end

function var_0_5.onShowDialog(arg_45_0, arg_45_1, arg_45_2, arg_45_3, arg_45_4, arg_45_5)
	if arg_45_1 == 5 and string.find(arg_45_5, "Фракция") and arg_45_2 == "Лидеры" and sleaders ~= nil then
		leaders = ""
		dliaders = {}

		for iter_45_0 in string.gmatch(arg_45_5, "[^\n]+") do
			if iter_45_0.find(iter_45_0, "%[%d+%] (.+)\t(.+)") then
				local var_45_0, var_45_1 = iter_45_0.match(iter_45_0, "%[%d+%] (.+)\t(.+)")

				if iter_45_0.find(var_45_1:lower(), sleaders:lower()) then
                dliaders[#dliaders + 1] = "Ник лидера: " .. var_45_0 .. " | Фракция: " .. var_45_1
					leaders = leaders .. dliaders[#dliaders] .. "\n"
				end
			end
		end

		if checkLeaders then
			lua_thread.create(function()
				if #leaders > 0 then
					sampShowDialog(2256, "Поиск лидеров", "Нажмите на строку чтобы вставить в чат\n" .. leaders, "Выбрать", "Закрыть", 5)
				else
					sampShowDialog(0, "Поиск лидеров", "{FFFFFF}Поиск по запросу: '" .. sleaders .. "' не дал результатов", "Выбрать", "Закрыть", 0)
				end
			end)

			checkLeaders = false

			return false
		end
	end

	if arg_45_1 == 2 and sfarmID ~= nil and string.find(arg_45_5, "{00AB06}Фермеров") and string.find(arg_45_5, "{00AB06}Прорабов") then
		local var_45_2 = 0
		local var_45_3 = ""

		for iter_45_1 in string.gmatch(arg_45_5, "[^\n]+") do
			var_45_2 = var_45_2 + 1

			if var_45_2 == 1 then
				var_45_3 = "/pm " .. sfarmID .. " [Ферма|Рабочих|За куст] "
			else
				local var_45_4, var_45_5, var_45_6 = iter_45_1.match(iter_45_1, "%[.+%] {FFFFFF}%[Ферма №(.+)%]  {00AB06}Фермеров (.+)  {FFFF00}Цена за куст (.+)$")

				var_45_3 = var_45_3 .. "[" .. var_45_4 .. "|" .. var_45_5 .. "|" .. var_45_6:gsub("$", "") .. "] "
			end
		end

		lua_thread.create(function(arg_47_0)
			sampSetChatInputText(arg_47_0)
			sampSetChatInputEnabled(true)
		end, var_45_3)

		sfarmID = nil

		return false
	end

	if arg_45_1 == 2 and skazID ~= nil and var_0_59 == 2 and string.find(arg_45_5, "Мафии") and arg_45_2 == "Рейтинг" then
		lua_thread.create(function(arg_48_0)
			repeat
				wait(0)
			until ms > 500

			var_0_56 = os.clock() * 1000

			sampSendDialogResponse(arg_48_0, 1, 2, "")
		end, arg_45_0)

		var_0_59 = 3

		return false
	end

	if var_0_59 == 3 and arg_45_2 == "История" then
		lua_thread.create(function(arg_49_0)
			repeat
				wait(0)
			until ms > 500

			var_0_56 = os.clock() * 1000

			sampSendDialogResponse(arg_49_0, 1, 0, "")
		end, arg_45_0)

		var_0_59 = 4

		return false
	end

	if arg_45_1 == 5 and var_0_59 == 4 and string.find(arg_45_2, "Меню") then
		local var_45_7 = string.match(arg_45_5, "%[3%] (%a+).+")
		local var_45_8 = string.match(arg_45_5, "%[4%] (%a+).+")

		kaztext = string.format("Драконы у %s | Калигула у %s", var_45_7:gsub("Russian", "Russian Mafia"), var_45_8:gsub("Russian", "Russian Mafia"))
		var_0_59 = 0

		lua_thread.create(function(arg_50_0, arg_50_1, arg_50_2)
			repeat
				wait(0)
			until ms > 500

			var_0_56 = os.clock() * 1000

			local var_50_0 = string.format("/pm %s %s", arg_50_0, kaztext)

			sampSetChatInputText(var_50_0)
			sampSetChatInputEnabled(true)

			arg_50_0 = nil
		end, skazID, var_45_7, var_45_8)

		return false
	end
end

function var_0_5.onSendChat(arg_51_0)
	var_0_56 = os.clock() * 1000
end

function var_0_5.onSendCommand(arg_52_0)
	local var_52_0, var_52_1 = string.match(arg_52_0:lower(), "^%/([^ ]*)(.*)")

	if var_52_0 == "sduty" then
		var_0_43 = true
	end

	if var_52_0 == "car" then
		local var_52_2 = getCommandParams(var_52_1)

		sCarID, sCarName, bs = var_52_2[1], var_52_2[2], var_52_2[3]

		if sCarID ~= nil and sCarName ~= nil then
			if bs == nil then
				boostCar = false
			else
				boostCar = true
			end

			lua_thread.create(function()
				local var_53_0 = ""

				sCarName = sCarName:gsub(" ", "")
				sCarName = sCarName:gsub("%-", "%%-")

				for iter_53_0, iter_53_1 in pairs(var_0_68) do
					if string.find(iter_53_1:lower():gsub(" ", ""), sCarName:lower()) then
						var_53_0 = iter_53_1
					end
				end

				if #var_53_0 > 0 then
					local var_53_1, var_53_2, var_53_3, var_53_4, var_53_5 = string.match(var_53_0, "(.+) | (.+) | (.+) | (.+) | (.+)")

					if var_53_2 == "S" then
						if boostCar then
							sampAddChatMessage(" Скидки для автомобиля '" .. sCarName .. "' нету. Проверьте правильность написания!", -1)
						else
							local var_53_6 = var_53_3:gsub("%.", "")
							local var_53_7 = tonumber(var_53_5) / 100
							local var_53_8 = string.format("/pm %s%s [%s] [%s] > %s$ > 1 процент: %s$", sCarID, var_53_1, var_53_2, var_53_4, "Цена: от " .. var_53_6, var_53_5)

							wait(50)
							sampSetChatInputText(var_53_8)
							sampSetChatInputEnabled(true)
						end
					else
						local var_53_9 = var_53_3:gsub("%.", "")
						local var_53_10 = tonumber(var_53_9) - tonumber(var_53_9) * 20 / 100
						local var_53_11 = tonumber(var_53_5) / 100
						local var_53_12 = string.format("/pm %s%s [%s] [%s] > %s$ > 1 процент: %s$", sCarID, var_53_1, var_53_2, var_53_4, boostCar and "Цена со скидкой " .. var_53_10 or "Цена в салоне " .. var_53_9, var_53_5)

						wait(50)
						sampSetChatInputText(var_53_12)
						sampSetChatInputEnabled(true)
					end
				else
					sampAddChatMessage(" Автомобиль '" .. sCarName .. "' не найден. Проверьте правильность написания!", -1)
				end
			end)
		else
			sampAddChatMessage(" /car [ID] [Название]", -1)
		end

		return false
	end

	if var_52_0 == "sgps" then
		local var_52_3, var_52_4 = arg_52_0:match("(%d+) (.+)")

		if var_52_3 ~= nil and var_52_4 ~= nil then
			lua_thread.create(function()
				local var_54_0 = ""

				for iter_54_0, iter_54_1 in pairs(var_0_69) do
					if string.rlower(iter_54_1):find(string.rlower(var_52_4)) then
						var_54_0 = iter_54_1
					end
				end

				if #var_54_0 > 0 then
					local var_54_1, var_54_2 = string.match(var_54_0, "(.+) | (.+)")
					local var_54_3 = string.format("/pm %s %s | [%s]", var_52_3, var_54_1, var_54_2)

					wait(50)
					sampSetChatInputText(var_54_3)
					sampSetChatInputEnabled(true)
				else
					sampAddChatMessage(" GPS '" .. var_52_4 .. "' не найден. Проверьте правильность написания!", -1)
				end
			end)
		else
			sampAddChatMessage(" /sgps [ID игрока] [Название организации]", -1)
			sampAddChatMessage(" Начните ввод — затем выберите нужный вариант из списка", -1)
		end

		return false
	end

	if var_52_0 == "hcost" then
		local var_52_5 = getCommandParams(var_52_1)
		local var_52_6 = tonumber(var_52_5[1])
		local var_52_7 = tonumber(var_52_5[2])

		if var_52_7 ~= nil then
			var_0_50 = var_52_7
			var_0_51 = 1
		end
	end

	if var_52_0 == "sleaders" then
		local var_52_8 = getCommandParams(var_52_1)

		sleadersID = var_52_8[1]
		sleaders = var_52_8[2]

		if sleaders ~= nil and string.find(sleadersID, "%d+") and #sleaders > 0 then
			checkLeaders = true
		end
	end

	if var_52_0 == "sfarm" and var_52_1:find("%d+") then
		sfarmID = var_52_1:match("(%d+)")

		sampSendChat("/taxigps")

		return false
	end

	if var_52_0 == "pm" then
		local var_52_9 = getCommandParams(var_52_1)

		if var_52_9[1] ~= nil and string.find(var_52_9[1], "%d+") and var_52_9[2] == nil then
			PMcmd = var_52_9[1]
			stopThread = true

			lua_thread.create(function()
				var_0_88.imgui_active2.v = true
			end)

			return false
		end
	end

	if var_52_0 == "skaz" and var_52_1:find("%d+") then
		skazID = var_52_1:match("(%d+)")

		if kaztext ~= nil then
			local var_52_10 = string.format("/pm %s %s", skazID, kaztext)

			sampSendChat(var_52_10)
		else
			var_0_59 = 1
		end

		return false
	end

	var_0_56 = os.clock() * 1000
end

local var_0_91 = {
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	"Ё",
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	"ё",
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	"А",
	"Б",
	"В",
	"Г",
	"Д",
	"Е",
	"Ж",
	"З",
	"И",
	"Й",
	"К",
	"Л",
	"М",
	"Н",
	"О",
	"П",
	"Р",
	"С",
	"Т",
	"У",
	"Ф",
	"Х",
	"Ц",
	"Ч",
	"Ш",
	"Щ",
	"Ъ",
	"Ы",
	"Ь",
	"Э",
	"Ю",
	"Я",
	"а",
	"б",
	"в",
	"г",
	"д",
	"е",
	"ж",
	"з",
	"и",
	"й",
	"к",
	"л",
	"м",
	"н",
	"о",
	"п",
	"р",
	"с",
	"т",
	"у",
	"ф",
	"х",
	"ц",
	"ч",
	"ш",
	"щ",
	"ъ",
	"ы",
	"ь",
	"э",
	"ю",
	"я"
}

function string.rlower(arg_56_0)
	arg_56_0 = arg_56_0:lower()

	local var_56_0 = arg_56_0:len()

	if var_56_0 == 0 then
		return arg_56_0
	end

	arg_56_0 = arg_56_0:lower()

	local var_56_1 = ""

	for iter_56_0 = 1, var_56_0 do
		local var_56_2 = arg_56_0:byte(iter_56_0)

		if var_56_2 >= 192 and var_56_2 <= 223 then
			var_56_1 = var_56_1 .. var_0_91[var_56_2 + 32]
		elseif var_56_2 == 168 then
			var_56_1 = var_56_1 .. var_0_91[184]
		else
			var_56_1 = var_56_1 .. string.char(var_56_2)
		end
	end

	return var_56_1
end

function string.rupper(arg_57_0)
	arg_57_0 = arg_57_0:upper()

	local var_57_0 = arg_57_0:len()

	if var_57_0 == 0 then
		return arg_57_0
	end

	arg_57_0 = arg_57_0:upper()

	local var_57_1 = ""

	for iter_57_0 = 1, var_57_0 do
		local var_57_2 = arg_57_0:byte(iter_57_0)

		if var_57_2 >= 224 and var_57_2 <= 255 then
			var_57_1 = var_57_1 .. var_0_91[var_57_2 - 32]
		elseif var_57_2 == 184 then
			var_57_1 = var_57_1 .. var_0_91[168]
		else
			var_57_1 = var_57_1 .. string.char(var_57_2)
		end
	end

	return var_57_1
end

function iniSet(arg_58_0, arg_58_1)
	var_0_76.tag[arg_58_0] = arg_58_1

	var_0_1.save(var_0_76, "Support Helper\\SH-settings.ini")
end

function var_0_6.OnDrawFrame()
	if var_0_88.imgui_active.v then
		var_0_6.ShowCursor = true

		var_0_6.SetNextWindowSize(var_0_6.ImVec2(937, 504), var_0_6.Cond.FirstUseEver)
		var_0_6.SetNextWindowPos(var_0_6.ImVec2(var_0_71 / 2, var_0_72 / 2), var_0_6.Cond.FirstUseEver, var_0_6.ImVec2(0.5, 0.5))
		var_0_6.Begin(u8("  Настройка ответов"), var_0_88.imgui_active, var_0_6.WindowFlags.NoResize + var_0_6.WindowFlags.NoCollapse)

		if not var_0_40 and var_0_6.Combo(u8("Список"), var_0_61, var_0_60) and var_0_61.v ~= 0 and var_0_61.v ~= #var_0_60 then
			var_0_74.v = u8(var_0_36[var_0_61.v].name)
			var_0_75.v = string.gsub(u8(var_0_36[var_0_61.v].text1), "&", "\n")
			var_0_73 = i
		end

		if not var_0_40 then
			var_0_6.Separator()
			var_0_6.PushStyleVar(var_0_6.StyleVar.ButtonTextAlign, var_0_6.ImVec2(0.5, 0.5))

			if var_0_6.Button(u8("Добавить в список новый подпункт")) then
				local var_59_0 = "Список ответов №" .. #var_0_36 + 1

				for iter_59_0, iter_59_1 in pairs(var_0_36) do
					if var_0_36[iter_59_0].name == var_59_0 then
						var_59_0 = var_59_0 .. " (1)"
					end
				end

				table.insert(var_0_36, {
					text1 = "",
					name = var_59_0
				})
				var_0_1.save(var_0_36, var_0_3)

				var_0_60 = {
					u8("Не выбрано")
				}

				for iter_59_2, iter_59_3 in pairs(var_0_36) do
					table.insert(var_0_60, u8(iter_59_3.name))
				end

				var_0_62 = {
					u8("Не выбрано")
				}

				for iter_59_4, iter_59_5 in pairs(var_0_36) do
					table.insert(var_0_62, u8(iter_59_5.name))
				end

				var_0_61.v = 0
			end

			var_0_6.PopStyleVar(1)
		end

		if var_0_40 or var_0_61.v == 0 then
			-- block empty
		else
			var_0_6.Separator()
			var_0_6.PushStyleVar(var_0_6.StyleVar.ButtonTextAlign, var_0_6.ImVec2(0.5, 0.5))

			if var_0_6.Button(u8(" Редактировать"), var_0_6.ImVec2(110, 20)) then
				var_0_40 = true

				var_0_1.save(var_0_36, var_0_3)
			end

			var_0_6.PopStyleVar(1)
		end

		var_0_6.SameLine()

		if var_0_40 or var_0_61.v == 0 then
			-- block empty
		else
			var_0_6.PushStyleVar(var_0_6.StyleVar.ButtonTextAlign, var_0_6.ImVec2(0.5, 0.5))

			if var_0_6.Button(u8(" Удалить"), var_0_6.ImVec2(125, 20)) then
				local var_59_1 = 0

				for iter_59_6, iter_59_7 in pairs(var_0_36) do
					var_59_1 = var_59_1 + 1
				end

				if var_59_1 ~= 1 then
					table.remove(var_0_36, var_0_61.v)
					var_0_1.save(var_0_36, var_0_3)
				else
					table.remove(var_0_36, var_0_73)

					files = io.open("moonloader\\config\\Support Helper\\otvets.ini", "w+")

					files:close()
				end

				sampAddChatMessage(var_0_13 .. " {FFFFFF} Подпункт ответов {FFE4B5}\"" .. u8:decode(var_0_74.v) .. "\" {FF0000}удален.", 16776960)

				var_0_73 = 0
				var_0_60 = {
					u8("Не выбрано")
				}

				for iter_59_8, iter_59_9 in pairs(var_0_36) do
					table.insert(var_0_60, u8(iter_59_9.name))
				end

				var_0_62 = {
					u8("Не выбрано")
				}

				for iter_59_10, iter_59_11 in pairs(var_0_36) do
					table.insert(var_0_62, u8(iter_59_11.name))
				end

				var_0_61.v = 0
			end

			var_0_6.PopStyleVar(1)
		end

		if var_0_73 ~= 0 then
			if var_0_40 or var_0_61.v == 0 then
				-- block empty
			else
				var_0_6.Separator()
				var_0_6.Text(u8("Название:"))
				var_0_6.SameLine()
				var_0_6.TextColoredRGB(u8("{FFE4B5}") .. u8(var_0_36[var_0_61.v].name))
				var_0_6.InputText(u8("Поиск"), var_0_8)
				var_0_6.Separator()

				if var_0_8.v ~= "" then
					for iter_59_12 in var_0_75.v:gmatch("[^\r\n]+") do
						if iter_59_12:find(var_0_8.v) then
							var_0_6.Text(iter_59_12)
						end
					end
				else
					for iter_59_13 in var_0_75.v:gmatch("[^\r\n]+") do
						if iter_59_13:find(var_0_8.v) then
							var_0_6.Text(iter_59_13)
						end
					end
				end
			end

			if var_0_40 then
				var_0_6.PushStyleVar(var_0_6.StyleVar.ButtonTextAlign, var_0_6.ImVec2(0.5, 0.5))

				if var_0_6.Button(u8(" Сохранить"), var_0_6.ImVec2(125, 20)) then
					var_0_36[var_0_61.v].name = u8:decode(var_0_74.v)
					var_0_36[var_0_61.v].text1 = string.gsub(u8:decode(var_0_75.v), "\n", "&")
					var_0_40 = false

					var_0_1.save(var_0_36, var_0_3)
					sampAddChatMessage(var_0_13 .. " {FFFFFF} Подпункт ответов {FFE4B5}\"" .. u8:decode(var_0_74.v) .. "\" {FFA500}сохранен.", 16776960)

					var_0_60 = {
						u8("Не выбрано")
					}

					for iter_59_14, iter_59_15 in pairs(var_0_36) do
						table.insert(var_0_60, u8(iter_59_15.name))
					end

					var_0_62 = {
						u8("Не выбрано")
					}

					for iter_59_16, iter_59_17 in pairs(var_0_36) do
						table.insert(var_0_62, u8(iter_59_17.name))
					end
				end

				var_0_6.PopStyleVar(1)
				var_0_6.SameLine()
				var_0_6.PushStyleVar(var_0_6.StyleVar.ButtonTextAlign, var_0_6.ImVec2(0.5, 0.5))

				if var_0_6.Button(u8("Отмена"), var_0_6.ImVec2(125, 20)) then
					var_0_40 = false
					var_0_74.v = u8(var_0_36[var_0_61.v].name)
					var_0_75.v = string.gsub(u8(var_0_36[var_0_61.v].text1), "&", "\n")
				end

				var_0_6.PopStyleVar(1)
				var_0_6.Separator()
				var_0_6.Text(u8("Название:"))
				var_0_6.SameLine()
				var_0_6.PushItemWidth(150)
				var_0_6.InputText(u8(""), var_0_74)
				var_0_6.InputTextMultiline("    ", var_0_75, var_0_6.ImVec2(930, 423))
			end
		end

		var_0_6.End()
	end

	if var_0_88.imgui_active2.v then
		var_0_6.ShowCursor = true

		var_0_6.SetNextWindowSize(var_0_6.ImVec2(937, 504), var_0_6.Cond.FirstUseEver)
		var_0_6.SetNextWindowPos(var_0_6.ImVec2(var_0_71 / 2, var_0_72 / 2), var_0_6.Cond.FirstUseEver, var_0_6.ImVec2(0.5, 0.5))
		var_0_6.Begin(u8(" Список ответов"), var_0_88.imgui_active2)

		if var_0_6.Combo(u8("Список"), var_0_63, var_0_62) and var_0_63.v ~= 0 and var_0_63.v ~= #var_0_62 then
			var_0_74.v = u8(var_0_36[var_0_63.v].name)
			var_0_75.v = string.gsub(u8(var_0_36[var_0_63.v].text1), "&", "\n")
			var_0_73 = i
		end

		var_0_6.Separator()

		if var_0_73 == 0 or var_0_63.v == 0 then
			-- block empty
		else
			var_0_6.Text(u8("Название:"))
			var_0_6.SameLine()
			var_0_6.TextColoredRGB(u8("{FFE4B5}") .. u8(var_0_36[var_0_63.v].name))
			var_0_6.InputText(u8("Поиск"), var_0_9)
			var_0_6.Separator()

			if var_0_9.v ~= "" then
				for iter_59_18 in var_0_75.v:gmatch("[^\r\n]+") do
					if iter_59_18:find(var_0_9.v) then
						var_0_6.PushStyleColor(var_0_6.Col.HeaderHovered, 0)
						var_0_6.PushStyleColor(var_0_6.Col.HeaderActive, 0)
						var_0_6.PushStyleColor(var_0_6.Col.Header, 0)

						if var_0_6.Selectable(iter_59_18) then
							var_0_88.imgui_active2.v = not var_0_88.imgui_active2.v
							tekst = u8:decode(iter_59_18):match("^[%s]+(.+)")

							if tekst ~= nil then
								sampAddChatMessage(tekst, -1)
							else
								sampSetChatInputText("/pm " .. PMcmd .. " " .. u8:decode(iter_59_18))
								sampSetChatInputEnabled(true)
							end
						end

						var_0_6.PopStyleColor(3)
					end
				end
			else
				for iter_59_19 in var_0_75.v:gmatch("[^\r\n]+") do
					if iter_59_19:find(var_0_9.v) then
						var_0_6.PushStyleColor(var_0_6.Col.HeaderHovered, 0)
						var_0_6.PushStyleColor(var_0_6.Col.HeaderActive, 0)
						var_0_6.PushStyleColor(var_0_6.Col.Header, 0)

						if var_0_6.Selectable(iter_59_19) then
							var_0_88.imgui_active2.v = not var_0_88.imgui_active2.v
							tekst = u8:decode(iter_59_19):match("^[%s]+(.+)")

							if tekst ~= nil then
								sampAddChatMessage(tekst, -1)
							else
								sampSetChatInputText("/pm " .. PMcmd .. " " .. u8:decode(iter_59_19))
								sampSetChatInputEnabled(true)
							end
						end

						var_0_6.PopStyleColor(3)
					end
				end
			end
		end

		var_0_6.End()
	end

	if var_0_88.imgui_active3.v then
		_, myID = sampGetPlayerIdByCharHandle(PLAYER_PED)
		myName = sampGetPlayerNickname(myID)
		var_0_6.ShowCursor = true

		var_0_6.SetNextWindowSize(var_0_6.ImVec2(580, 450), var_0_6.Cond.FirstUseEver)
		var_0_6.SetNextWindowPos(var_0_6.ImVec2(var_0_71 / 2, var_0_72 / 2), var_0_6.Cond.FirstUseEver, var_0_6.ImVec2(0.5, 0.5))
		var_0_6.Begin(var_0_11.ICON_CLIPBOARD .. u8(" Главное окно Support Helper"), nil, var_0_6.WindowFlags.NoResize + var_0_6.WindowFlags.NoCollapse + var_0_6.WindowFlags.NoMove + var_0_6.WindowFlags.NoTitleBar + var_0_6.WindowFlags.NoScrollbar)
		
		if var_0_66 then
			var_0_6.BeginChild("dom111", var_0_6.ImVec2(800, 120), true)
			var_0_6.SetCursorPosX(var_0_6.GetCursorPosX() + 20)
            var_0_6.SetCursorPosX(130)
			var_0_6.Image(img, var_0_6.ImVec2(280, 45))
			var_0_6.Text("\t\t\t\t     ")
			var_0_6.SameLine()
			var_0_6.SetCursorPosX(170)
			var_0_6.Image(img1, var_0_6.ImVec2(200, 20.5))
			var_0_6.SetCursorPosX(170)
			var_0_6.TextColoredRGB(u8("Разработчик скрипта: ") .. var_0_11.ICON_USER_CIRCLE .. " {FFE4B5}Garfusha     ")
			var_0_6.SetCursorPosX(170)
			var_0_6.TextColoredRGB(u8("Текущая версия: {00FF00}актуальная {008000}") .. var_0_11.ICON_CHECK_CIRCLE .. "     ")

			var_0_6.SameLine()
			var_0_6.PushStyleVar(var_0_6.StyleVar.FrameRounding, 6)

			if var_0_6.Button("" .. var_0_11.ICON_CLOCK_O) then
				local var_59_2, var_59_3 = sampGetPlayerIdByCharHandle(PLAYER_PED)

				nickname = sampGetPlayerNickname(var_59_3)

				if var_0_76.tag.SupportName == nickname and var_0_41 then
					var_0_88.imgui_active4.v = true
					var_0_88.imgui_active3.v = false
				else
					sampAddChatMessage(var_0_13 .. " {FF0000}Ошибка! {FFFFFF}Данное действие возможно сделать только с основного аккаунта", 16776960)
				end
			end

			var_0_6.PopStyleVar(1)
			var_0_6.SameLine()

			var_0_6.EndChild()
			var_0_6.SetCursorPosX(var_0_6.GetCursorPosX() + 36)
			var_0_6.BeginChild("dom11", var_0_6.ImVec2(228, 88), true)
			var_0_6.PushStyleColor(var_0_6.Col.Button, var_0_6.ImVec4(0.09, 0.09, 0.09, 0.94))
			var_0_6.PushStyleVar(var_0_6.StyleVar.ButtonTextAlign, var_0_6.ImVec2(0.5, 0.5))
			var_0_6.SetWindowFontScale(1.1)

			if var_0_6.Button("" .. var_0_11.ICON_ID_CARD .. u8(" Настройка аккаунта"), var_0_6.ImVec2(220, 80)) then
				var_0_64 = 1
				var_0_66 = false
			end

			var_0_6.PopStyleVar(1)
			var_0_6.PopStyleColor(1)
			var_0_6.EndChild()
			var_0_6.SameLine()
			var_0_6.Text("\t\t")
			var_0_6.SameLine()
			var_0_6.BeginChild("dom12", var_0_6.ImVec2(228, 88), true)
			var_0_6.PushStyleColor(var_0_6.Col.Button, var_0_6.ImVec4(0.09, 0.09, 0.09, 0.94))
			var_0_6.PushStyleVar(var_0_6.StyleVar.ButtonTextAlign, var_0_6.ImVec2(0.5, 0.5))
			var_0_6.SetWindowFontScale(1.1)

			if var_0_6.Button(u8("        ") .. var_0_11.ICON_COMMENTS .. u8(" Настройка чата\n      (настройка отображения\n сообщений, фильтрации чата и\n              доп. функций.)"), var_0_6.ImVec2(220, 80)) then
				var_0_64 = 2
				var_0_66 = false
			end

			var_0_6.PopStyleVar(1)
			var_0_6.PopStyleColor(1)
			var_0_6.EndChild()
			var_0_6.Text("         ")
			var_0_6.SameLine()
			var_0_6.BeginChild("dom13", var_0_6.ImVec2(228, 88), true)
			var_0_6.PushStyleColor(var_0_6.Col.Button, var_0_6.ImVec4(0.09, 0.09, 0.09, 0.94))
			var_0_6.PushStyleVar(var_0_6.StyleVar.ButtonTextAlign, var_0_6.ImVec2(0.5, 0.5))
			var_0_6.SetWindowFontScale(1.1)

			if var_0_6.Button("" .. var_0_11.ICON_CALENDAR .. u8(" Статистика работы"), var_0_6.ImVec2(220, 80)) then
				local var_59_4 = io.open("moonloader\\config\\Support Helper\\pm.ini", "r")
				local var_59_5 = {}
				local var_59_6 = {}
				local var_59_7 = {}
				local var_59_8 = {}
				local var_59_9 = ""
				local var_59_10 = 0
				local var_59_11 = 0
				local var_59_12 = 0

				if var_59_4 ~= nil then
					for iter_59_20 in var_59_4:lines() do
						if string.find(iter_59_20, "%[(.+)|.+%] PayDay") then
							local var_59_13 = string.match(iter_59_20, "%[(.+)|.+%] PayDay")

							if var_59_8[var_59_13] ~= nil then
								var_59_8[var_59_13] = var_59_8[var_59_13] + 1
							else
								var_59_8[var_59_13] = 1
							end

							var_59_10 = var_59_10 + 1
						end

						if string.find(iter_59_20, "%[(.+)|.+%] .." .. var_0_76.tag.SupportName .. "%[%d+%] to .+%[%d+%]: .+") then
							local var_59_14, var_59_15 = string.match(iter_59_20, "%[(.+)|.+%] ..(" .. var_0_76.tag.SupportName .. "%[%d+%] to .+%[%d+%]: .+)")

							if var_59_9 == var_59_14 then
								var_59_5[#var_59_5] = var_59_5[#var_59_5] + 1
							else
								var_59_9 = var_59_14
								var_59_5[#var_59_5 + 1] = 1
								var_59_6[#var_59_5] = var_59_14
							end

							var_59_11 = var_59_11 + 1
						end

						if string.find(iter_59_20, "%[(.+)|.+%] OtvetReiting") then
							local var_59_16 = string.match(iter_59_20, "%[(.+)|.+%] OtvetReiting")

							if var_59_7[var_59_16] ~= nil then
								var_59_7[var_59_16] = var_59_7[var_59_16] + 1
							else
								var_59_7[var_59_16] = 1
							end

							var_59_12 = var_59_12 + 1
						end
					end

					io.close(var_59_4)
				end

				DialogText = ""

				for iter_59_21, iter_59_22 in pairs(var_59_5) do
					if var_59_8[var_59_6[iter_59_21]] == nil then
						var_59_8[var_59_6[iter_59_21]] = 0
					end

					if var_59_7[var_59_6[iter_59_21]] == nil then
						var_59_7[var_59_6[iter_59_21]] = 0
					end

					DialogText = string.format("%s\t%s / %s\t%s\t%s\n%s", var_59_6[iter_59_21], var_59_5[iter_59_21], var_59_7[var_59_6[iter_59_21]], var_59_8[var_59_6[iter_59_21]], var_59_8[var_59_6[iter_59_21]] * 30000, DialogText)
				end

				DialogText = "Дата\tОтветы / Отв.(!)\tPayDay\tЗарплата\n" .. DialogText .. "\nВсего:\t" .. var_59_11 .. " / " .. var_59_12 .. "\t" .. var_59_10 .. "\t" .. var_59_10 * 30000 .. "\nОтветы(w): \t" .. var_0_77.Weekset.online .. " / " .. var_0_77.Weekset.onlinereting

				sampShowDialog(8888, "Support Helper | Samp-RP", DialogText, "Выбрать", "Назад", 5)

				var_0_88.imgui_active3.v = false
			end

			var_0_6.PopStyleVar(1)
			var_0_6.PopStyleColor(1)
			var_0_6.EndChild()
			var_0_6.SameLine()
			var_0_6.Text("\t\t")
			var_0_6.SameLine()
			var_0_6.BeginChild("dom14", var_0_6.ImVec2(228, 88), true)
			var_0_6.PushStyleColor(var_0_6.Col.Button, var_0_6.ImVec4(0.09, 0.09, 0.09, 0.94))
			var_0_6.PushStyleVar(var_0_6.StyleVar.ButtonTextAlign, var_0_6.ImVec2(0.5, 0.5))
			var_0_6.SetWindowFontScale(1.1)

			if var_0_6.Button("           " .. var_0_11.ICON_COG .. u8(" Бинд клавиш\n    (настройка горячих клавиш\n     для ответа, открытия окон\n управления функциями скрипта"), var_0_6.ImVec2(220, 80)) then
				var_0_64 = 3
				var_0_66 = false
			end

			var_0_6.PopStyleVar(1)
			var_0_6.PopStyleColor(1)
			var_0_6.EndChild()
			var_0_6.Text("         ")
			var_0_6.SameLine()
			var_0_6.BeginChild("dom15", var_0_6.ImVec2(228, 88), true)
			var_0_6.PushStyleColor(var_0_6.Col.Button, var_0_6.ImVec4(0.09, 0.09, 0.09, 0.94))
			var_0_6.PushStyleVar(var_0_6.StyleVar.ButtonTextAlign, var_0_6.ImVec2(0.5, 0.5))
			var_0_6.SetWindowFontScale(1.1)

			if var_0_6.Button("" .. var_0_11.ICON_TEXT_HEIGHT .. u8(" Настройки интерфейса"), var_0_6.ImVec2(220, 80)) then
				var_0_64 = 4
				var_0_66 = false
			end

			var_0_6.PopStyleVar(1)
			var_0_6.PopStyleColor(1)
			var_0_6.EndChild()
			var_0_6.SameLine()
			var_0_6.Text("\t\t")
			var_0_6.SameLine()
			var_0_6.BeginChild("dom16", var_0_6.ImVec2(228, 88), true)
			var_0_6.PushStyleColor(var_0_6.Col.Button, var_0_6.ImVec4(0.09, 0.09, 0.09, 0.94))
			var_0_6.PushStyleVar(var_0_6.StyleVar.ButtonTextAlign, var_0_6.ImVec2(0.5, 0.5))
			var_0_6.SetWindowFontScale(1.1)

			if var_0_6.Button("" .. var_0_11.ICON_LIST .. u8(" Команды скрипта"), var_0_6.ImVec2(220, 80)) then
				var_0_88.imgui_active5.v = true
				var_0_88.imgui_active3.v = false
			end

			var_0_6.PopStyleVar(1)
			var_0_6.PopStyleColor(1)
			var_0_6.EndChild()
		end

		if var_0_64 == 1 then
			var_0_6.BeginChild("dom#1", var_0_6.ImVec2(572, 30), true)
			var_0_6.PushStyleVar(var_0_6.StyleVar.FrameRounding, 6)

			if var_0_6.Button("" .. var_0_11.ICON_ARROW_LEFT) then
				var_0_64 = 0
				var_0_66 = true
			end

			var_0_6.SameLine()
			var_0_6.Text(u8("Support Helper | Samp-RP"))
			var_0_6.PopStyleVar(1)
			var_0_6.EndChild()
			var_0_6.BeginChild("dom1", var_0_6.ImVec2(572, 322), true)
			var_0_6.TextColoredRGB(u8("\t\t\t\t\t\t\t\t\t\t\t\t\t\t   {808080}» {EEE8AA}Настройка аккаунта {808080}«"))
			var_0_6.Separator()
			var_0_6.TextColoredRGB(u8("Ваш NickName: {FFE4B5}") .. var_0_76.tag.SupportName)

			if var_0_6.Button(u8("Использовать как основной аккаунт")) then
				var_0_88.SupportName.v = myName
				var_0_76.tag.SupportName = var_0_88.SupportName.v

				savesettings()
			end

			var_0_6.SameLine()
			var_0_6.TextDisabled(u8("(?)"))

			if var_0_6.IsItemHovered() then
				var_0_6.BeginTooltip()
				var_0_6.TextUnformatted(u8("Только для него будет работать автоматическое начало дня"))
				var_0_6.EndTooltip()
			end

			var_0_6.Text(u8("Автоматическое начало дня (sduty)"))
			var_0_6.SameLine()

			if var_0_6.ToggleButton("##1", var_0_88.activeAutoSduty) then
				-- block empty
			end

			var_0_6.Separator()
			var_0_6.Text(u8("Расширенный чат помощников"))
			var_0_6.SameLine()

			if var_0_6.ToggleButton("##10", var_0_88.activechatsup) then
				-- block empty
			end

			var_0_6.SameLine()
			var_0_6.TextDisabled(u8("(?)"))

			if var_0_6.IsItemHovered() then
				var_0_6.BeginTooltip()
				var_0_6.TextUnformatted(u8("Добавляет ID игрока к нику в чате (/sc)\nФормат: Nick_Name > Nick_Name[ID]"))
				var_0_6.EndTooltip()
			end

			var_0_6.Separator()
			var_0_6.Text(u8("Вывод чата игровых помощников в отдельное окно"))
			var_0_6.SameLine()

			if var_0_6.ToggleButton("##91", var_0_88.activerenderchatsupports) then
				-- block empty
			end

			if var_0_6.Button(u8("Сменить позицию вывода чата игровых помощников")) and var_0_88.activerenderchatsupports.v then
				sampAddChatMessage(var_0_13 .. " {FFFFFF}Для сохранения положения нажмите {ff004d}ПРОБЕЛ", 16776960)

				editingPosP2 = true

				showCursor(true)

				var_0_88.imgui_active3.v = false
			end

			if var_0_88.activerenderchatsupports.v then
				var_0_6.Text(u8("Cкрыть чат саппортов в чате"))
				var_0_6.SameLine()

				if var_0_6.ToggleButton("##911", var_0_88.activeclearchatsupports) then
					-- block empty
				end

				var_0_6.Text(u8("Кол-во строк в окне вывода чата игровых повощников: "))
				var_0_6.SameLine()
				var_0_6.PushItemWidth(120)

				if var_0_6.SliderFloat("##per5", var_0_88.global_Line2, 0, 100, "%.0f") and var_0_88.global_Line2.v >= 1 and var_0_88.global_Line2.v <= 100 then
					-- block empty
				end

				var_0_6.PopItemWidth()
			end

			var_0_6.Separator()
			var_0_6.PushStyleVar(var_0_6.StyleVar.ButtonTextAlign, var_0_6.ImVec2(0.5, 0.5))

			if var_0_6.Button("" .. var_0_11.ICON_FLOPPY_O .. u8(" Сохранить настройки")) then
				var_0_76.tag.activeAutoSduty = var_0_88.activeAutoSduty.v
				var_0_76.tag.active2 = var_0_88.active2.v
				var_0_76.tag.active3 = var_0_88.active3.v
				var_0_76.tag.active6 = var_0_88.active6.v
				var_0_76.tag.active5 = var_0_88.active5.v
				var_0_76.tag.color = var_0_88.color.v
				var_0_76.tag.SupportName = var_0_88.SupportName.v
				var_0_76.tag.FontName = var_0_88.FontName.v
				var_0_76.tag.global_FontSize = var_0_88.global_FontSize.v
				var_0_76.tag.global_FontFlag = var_0_88.global_FontFlag.v
				var_0_76.tag.global_FontSize1 = var_0_88.global_FontSize1.v
				var_0_76.tag.global_Line = var_0_88.global_Line.v
				var_0_76.tag.global_Line2 = var_0_88.global_Line2.v
				var_0_76.tag.activechatsup = var_0_88.activechatsup.v
				var_0_76.tag.activerenderchatsupports = var_0_88.activerenderchatsupports.v
				var_0_76.tag.activeclearchatsupports = var_0_88.activeclearchatsupports.v

				savesettings()

				font = renderCreateFont(var_0_76.tag.FontName, var_0_76.tag.global_FontSize, var_0_76.tag.global_FontFlag)
				font1 = renderCreateFont(var_0_76.tag.FontName, var_0_76.tag.global_FontSize1, var_0_76.tag.global_FontFlag)
				font2 = renderCreateFont(var_0_76.tag.FontName, var_0_76.tag.global_FontSize, var_0_76.tag.global_FontFlag)

				sampAddChatMessage(var_0_13 .. " {FFFFFF} Настройки скрипта успешно {FFA500}сохранены", 16776960)
			end

			var_0_6.PopStyleVar(1)
			var_0_6.SameLine()
			var_0_6.TextDisabled(u8("(?)"))

			if var_0_6.IsItemHovered() then
				var_0_6.BeginTooltip()
				var_0_6.TextUnformatted(u8("Если после настройки какого либо парамератра / пункта / подпункта в этом окне\nвы не нажмете кнопку \"сохранить настройки\", то, изменения не вступят в силу"))
				var_0_6.EndTooltip()
			end

			var_0_6.EndChild()
		end

		if var_0_64 == 2 then
			var_0_6.BeginChild("dom#11", var_0_6.ImVec2(572, 30), true)
			var_0_6.PushStyleVar(var_0_6.StyleVar.FrameRounding, 6)

			if var_0_6.Button("" .. var_0_11.ICON_ARROW_LEFT) then
				var_0_64 = 0
				var_0_66 = true
			end

			var_0_6.SameLine()
			var_0_6.Text(u8("Support Helper | Samp-RP"))
			var_0_6.PopStyleVar(1)
			var_0_6.EndChild()
			var_0_6.BeginChild("dom#12", var_0_6.ImVec2(572, 322), true)
			var_0_6.TextColoredRGB(u8("\t\t\t\t\t\t\t\t\t\t\t\t\t\t       {808080}» {EEE8AA}Настройка чата {808080}«"))
			var_0_6.Separator()
			var_0_6.Text(u8("Скрывать вопросы из чата"))
			var_0_6.SameLine()

			if var_0_6.ToggleButton("##2", var_0_88.active2) then
				-- block empty
			end

			var_0_6.Text(u8("Скрывать чужие ответы из чата"))
			var_0_6.SameLine()

			if var_0_6.ToggleButton("##3", var_0_88.active3) then
				-- block empty
			end

			var_0_6.Separator()
			var_0_6.Text(u8("Перекрасить чат игровых помощников"))
			var_0_6.SameLine()

			if var_0_6.ToggleButton("##4", var_0_88.activesupcolor) then
				-- block empty
			end

			var_0_6.Text(u8("Цвет чата игровых помощников: "))
			var_0_6.SameLine()
			var_0_6.PushItemWidth(120)
			var_0_6.InputText("##1231", var_0_88.supchatcolor)
			var_0_6.SameLine()
			var_0_6.TextDisabled(u8("(?)"))

			if var_0_6.IsItemHovered() then
				var_0_6.BeginTooltip()
				var_0_6.TextUnformatted(u8("Цвет текста должен быть в формате HEX. Пример: FFFFFF"))
				var_0_6.EndTooltip()
			end

			var_0_6.Separator()
			var_0_6.Text(u8("Автоматическое наполнение базы вопросов и ответов"))
var_0_6.SameLine()

if var_0_6.ToggleButton("##aifaq", var_0_88.aifaqsystem) then
    -- block empty
end

var_0_6.SameLine()
var_0_6.TextDisabled("(?)")

if var_0_6.IsItemHovered() then
	var_0_6.BeginTooltip()
	var_0_6.Text(u8("Система автоматически сохраняет вопросы игроков\nи ответы саппортов в локальную базу данных.\nПри повторных похожих вопросах эта функция\nподскажет готовый ответ.\n\nПосле каждого сохранения вопроса или ответа\nв чат выводится уведомление, возможен флуд."))
	var_0_6.EndTooltip()
end

var_0_6.Separator()
			var_0_6.Text(u8("Перекрасить вопрос в чате"))
			var_0_6.SameLine()

			if var_0_6.ToggleButton("##5", var_0_88.activevop) then
				-- block empty
			end

			var_0_6.Text(u8("Цвет вопроса в чате: "))
			var_0_6.SameLine()
			var_0_6.PushItemWidth(120)
			var_0_6.InputText("##12312", var_0_88.vopchatcolor)
			var_0_6.SameLine()
			var_0_6.TextDisabled(u8("(?)"))

			if var_0_6.IsItemHovered() then
				var_0_6.BeginTooltip()
				var_0_6.TextUnformatted(u8("Цвет текста должен быть в формате HEX. Пример: FFFFFF"))
				var_0_6.EndTooltip()
			end

			var_0_6.Separator()
			var_0_6.Text(u8("Перекрасить чужие ответы в чате"))
			var_0_6.SameLine()

			if var_0_6.ToggleButton("##6", var_0_88.activeotvetcolor) then
				-- block empty
			end

			var_0_6.Text(u8("Цвет чужих ответов: "))
			var_0_6.SameLine()
			var_0_6.PushItemWidth(120)
			var_0_6.InputText("##123121", var_0_88.otvetcolor)
			var_0_6.SameLine()
			var_0_6.TextDisabled(u8("(?)"))

			if var_0_6.IsItemHovered() then
				var_0_6.BeginTooltip()
				var_0_6.TextUnformatted(u8("Цвет текста должен быть в формате HEX. Пример: FFFFFF"))
				var_0_6.EndTooltip()
			end

			var_0_6.Separator()
			var_0_6.Text(u8("Перекрасить мои ответы в чате"))
			var_0_6.SameLine()

			if var_0_6.ToggleButton("##7", var_0_88.activemyotvetcolor) then
				-- block empty
			end

			var_0_6.Text(u8("Цвет моих ответов: "))
			var_0_6.SameLine()
			var_0_6.PushItemWidth(120)
			var_0_6.InputText("##1231212", var_0_88.myotvetcolor)
			var_0_6.SameLine()
			var_0_6.TextDisabled(u8("(?)"))

			if var_0_6.IsItemHovered() then
				var_0_6.BeginTooltip()
				var_0_6.TextUnformatted(u8("Цвет текста должен быть в формате HEX. Пример: FFFFFF"))
				var_0_6.EndTooltip()
			end

			var_0_6.Separator()
			var_0_6.Text(u8("Показывать информацию на экране"))
			var_0_6.SameLine()

			if var_0_6.ToggleButton("##9111", var_0_88.activeokno_infoscreen_otvet_) then
				-- block empty
			end

			if var_0_6.Button(u8("Сменить позицию информации на экране")) and var_0_88.activeokno_infoscreen_otvet_.v then
				sampAddChatMessage(var_0_13 .. " {FFFFFF}Для сохранения положения нажмите {ff004d}ПРОБЕЛ", 16776960)

				editingPosP3 = true

				showCursor(true)

				var_0_88.imgui_active3.v = false
			end

			if var_0_88.activeokno_infoscreen_otvet_.v then
				var_0_6.Text(u8("Шрифт текста информации на экране: "))
				var_0_6.SameLine()
				var_0_6.PushItemWidth(120)
				var_0_6.InputText("##121231", var_0_88.FontName_infoscreen_otvet_)
				var_0_6.SameLine()
				var_0_6.TextDisabled(u8("(?)"))

				if var_0_6.IsItemHovered() then
					var_0_6.BeginTooltip()
					var_0_6.TextUnformatted(u8("Шрифт который вы тут укажите должен быть установлен у вас на компьютере"))
					var_0_6.EndTooltip()
				end

				var_0_6.Text(u8("Перекрасить информацию на экране"))
				var_0_6.SameLine()

				if var_0_6.ToggleButton("##13", var_0_88.active_infoscreen_otvet_) then
					-- block empty
				end

				if var_0_88.active_infoscreen_otvet_ then
					var_0_6.Text(u8("Цвет информации на экране: "))
					var_0_6.SameLine()
					var_0_6.PushItemWidth(120)
					var_0_6.InputText("##1231277", var_0_88.infoscreen_otvet_)
					var_0_6.SameLine()
					var_0_6.TextDisabled(u8("(?)"))

					if var_0_6.IsItemHovered() then
						var_0_6.BeginTooltip()
						var_0_6.TextUnformatted(u8("Цвет текста должен быть в формате HEX. Пример: FFFFFF"))
						var_0_6.EndTooltip()
					end
				end

				var_0_6.Text(u8("Размер текста информации на экране: "))
				var_0_6.SameLine()
				var_0_6.PushItemWidth(120)

				if var_0_6.SliderFloat("##per6", var_0_88.FontSize_infoscreen_otvet_, 0, 100, "%.0f") and var_0_88.FontSize_infoscreen_otvet_.v >= 1 and var_0_88.FontSize_infoscreen_otvet_.v <= 100 then
					-- block empty
				end

				var_0_6.PopItemWidth()
				var_0_6.Text(u8("Стиль текста информации на экарне: "))
				var_0_6.SameLine()
				var_0_6.PushItemWidth(120)

				if var_0_6.SliderFloat("##per7", var_0_88.FontFlag_infoscreen_otvet_, 0, 100, "%.0f") and var_0_88.FontFlag_infoscreen_otvet_.v >= 1 and var_0_88.FontFlag_infoscreen_otvet_.v <= 100 then
					-- block empty
				end

				var_0_6.PopItemWidth()
			end

			var_0_6.Separator()
			var_0_6.PushStyleVar(var_0_6.StyleVar.ButtonTextAlign, var_0_6.ImVec2(0.5, 0.5))

			if var_0_6.Button("" .. var_0_11.ICON_FLOPPY_O .. u8(" Сохранить настройки")) then
				if #var_0_88.supchatcolor.v:gsub(" ", "") == 6 and #var_0_88.vopchatcolor.v:gsub(" ", "") == 6 and #var_0_88.infoscreen_otvet_.v:gsub(" ", "") == 6 and #var_0_88.otvetcolor.v:gsub(" ", "") == 6 and #var_0_88.myotvetcolor.v:gsub(" ", "") == 6 then
					var_0_76.tag.activeAutoSduty = var_0_88.activeAutoSduty.v
					var_0_76.tag.active2 = var_0_88.active2.v
					var_0_76.tag.active3 = var_0_88.active3.v
					var_0_76.tag.active6 = var_0_88.active6.v
					var_0_76.tag.active5 = var_0_88.active5.v
					var_0_76.tag.activesupcolor = var_0_88.activesupcolor.v
					var_0_76.tag.activevop = var_0_88.activevop.v
					var_0_76.tag.active_infoscreen_otvet_ = var_0_88.active_infoscreen_otvet_.v
					var_0_76.tag.activeotvetcolor = var_0_88.activeotvetcolor.v
					var_0_76.tag.activemyotvetcolor = var_0_88.activemyotvetcolor.v
					var_0_76.tag.color = var_0_88.color.v
					var_0_76.tag.supchatcolor = var_0_88.supchatcolor.v
					var_0_76.tag.vopchatcolor = var_0_88.vopchatcolor.v
					var_0_76.tag.infoscreen_otvet_ = var_0_88.infoscreen_otvet_.v
					var_0_76.tag.otvetcolor = var_0_88.otvetcolor.v
					var_0_76.tag.myotvetcolor = var_0_88.myotvetcolor.v
					var_0_76.tag.SupportName = var_0_88.SupportName.v
					var_0_76.tag.FontName = var_0_88.FontName.v
					var_0_76.tag.FontName_infoscreen_otvet_ = var_0_88.FontName_infoscreen_otvet_.v
					var_0_76.tag.global_FontSize = var_0_88.global_FontSize.v
					var_0_76.tag.global_FontFlag = var_0_88.global_FontFlag.v
					var_0_76.tag.FontFlag_infoscreen_otvet_ = var_0_88.FontFlag_infoscreen_otvet_.v
					var_0_76.tag.global_FontSize1 = var_0_88.global_FontSize1.v
					var_0_76.tag.FontSize_infoscreen_otvet_ = var_0_88.FontSize_infoscreen_otvet_.v
					var_0_76.tag.activeokno_infoscreen_otvet_ = var_0_88.activeokno_infoscreen_otvet_.v
					var_0_76.tag.global_Line = var_0_88.global_Line.v
					var_0_76.tag.global_Line2 = var_0_88.global_Line2.v

					savesettings()

					font = renderCreateFont(var_0_76.tag.FontName, var_0_76.tag.global_FontSize, var_0_76.tag.global_FontFlag)
					font1 = renderCreateFont(var_0_76.tag.FontName, var_0_76.tag.global_FontSize1, var_0_76.tag.global_FontFlag)
					font2 = renderCreateFont(var_0_76.tag.FontName, var_0_76.tag.global_FontSize, var_0_76.tag.global_FontFlag)
					font3 = renderCreateFont(var_0_76.tag.FontName_infoscreen_otvet_, var_0_76.tag.FontSize_infoscreen_otvet_, var_0_76.tag.FontFlag_infoscreen_otvet_)

					sampAddChatMessage(var_0_13 .. " {FFFFFF} Настройки скрипта успешно {FFA500}сохранены", 16776960)
				else
					sampAddChatMessage(var_0_13 .. " {FF0000}Ошибка! {FFFFFF}Сохранение не произошло. Цвет должен быть из 6 символов, пример: FFFFFF", 16776960)
				end
			end

			var_0_6.PopStyleVar(1)
			var_0_6.SameLine()
			var_0_6.TextDisabled(u8("(?)"))

			if var_0_6.IsItemHovered() then
				var_0_6.BeginTooltip()
				var_0_6.TextUnformatted(u8("Если после настройки какого либо парамератра / пункта / подпункта в этом окне\nвы не нажмете кнопку \"сохранить настройки\", то, изменения не вступят в силу"))
				var_0_6.EndTooltip()
			end

			var_0_6.EndChild()
		end

		if var_0_64 == 3 then
			var_0_6.BeginChild("dom#111", var_0_6.ImVec2(572, 30), true)
			var_0_6.PushStyleVar(var_0_6.StyleVar.FrameRounding, 6)

			if var_0_6.Button("" .. var_0_11.ICON_ARROW_LEFT) then
				var_0_64 = 0
				var_0_66 = true
			end

			var_0_6.SameLine()
			var_0_6.Text(u8("Support Helper | Samp-RP"))
			var_0_6.PopStyleVar(1)
			var_0_6.EndChild()
			var_0_6.BeginChild("dom#112", var_0_6.ImVec2(572, 322), true)
			var_0_6.TextColoredRGB(u8("\t\t\t\t\t\t\t\t\t\t\t\t\t\t         {808080}» {EEE8AA}Бинд клавиш {808080}«"))
			var_0_6.Separator()
			var_0_6.Text(u8("Клавиша для ответа на последний вопрос:"))
			var_0_6.SameLine()
			var_0_6.TextColoredRGB(u8("{FFE4B5}") .. var_0_76.tag.KeyPMLast:gsub("VK_", ""))

			if var_0_6.Button(u8("Сменить клавишу для ответа на последний вопрос")) then
				var_0_88.imgui_active3.v = false

				sampShowDialog(10, "Смена клавиши", "Нажмите на нужную клавишу", "Выбрать", "Назад", 0)
				lua_thread.create(function()
					local var_60_0 = ""

					wait(100)

					repeat
						wait(0)

						for iter_60_0, iter_60_1 in pairs(var_0_2) do
							if wasKeyPressed(iter_60_1) and iter_60_0 ~= "VK_ESCAPE" and iter_60_0 ~= "VK_RETURN" and iter_60_0 ~= "RBUTTON" and iter_60_0 ~= "LBUTTON" then
								var_60_0 = iter_60_0
							end
						end
					until var_60_0 ~= ""

					iniSet("KeyPMLast", var_60_0)
					wait(1)
					sampCloseCurrentDialogWithButton(0)

					var_0_88.imgui_active3.v = true
				end)
			end

			var_0_6.Separator()
			var_0_6.Text(u8("Клавиша для показа / скрытия окна с вопросами:"))
			var_0_6.SameLine()
			var_0_6.TextColoredRGB(u8("{FFE4B5}") .. var_0_76.tag.Keyokno:gsub("VK_", ""))

			if var_0_6.Button(u8("Сменить клавишу для показа / скрытия окна с вопросами")) then
				var_0_88.imgui_active3.v = false

				sampShowDialog(11, "Смена клавиши", "Нажмите на нужную клавишу", "Выбрать", "Назад", 0)
				lua_thread.create(function()
					local var_61_0 = ""

					wait(100)

					repeat
						wait(0)

						for iter_61_0, iter_61_1 in pairs(var_0_2) do
							if wasKeyPressed(iter_61_1) and iter_61_0 ~= "VK_ESCAPE" and iter_61_0 ~= "VK_RETURN" and iter_61_0 ~= "RBUTTON" and iter_61_0 ~= "LBUTTON" then
								var_61_0 = iter_61_0
							end
						end
					until var_61_0 ~= ""

					iniSet("Keyokno", var_61_0)
					wait(1)
					sampCloseCurrentDialogWithButton(0)

					var_0_88.imgui_active3.v = true
				end)
			end

			var_0_6.Separator()
			var_0_6.Text(u8("Клавиша для ответа:"))
			var_0_6.SameLine()
			var_0_6.TextColoredRGB(u8("{FFE4B5}") .. var_0_76.tag.KeyWindowPM:gsub("VK_", "") .. u8("{FFFFFF} + номер строки"))

			if var_0_6.Button(u8("Сменить клавишу для ответа")) then
				var_0_88.imgui_active3.v = false

				sampShowDialog(12, "Смена клавиши", "Нажмите на нужную клавишу", "Выбрать", "Назад", 0)
				lua_thread.create(function()
					local var_62_0 = ""

					wait(100)

					repeat
						wait(0)

						for iter_62_0, iter_62_1 in pairs(var_0_2) do
							if wasKeyPressed(iter_62_1) and iter_62_0 ~= "VK_ESCAPE" and iter_62_0 ~= "VK_RETURN" and iter_62_0 ~= "RBUTTON" and iter_62_0 ~= "LBUTTON" then
								var_62_0 = iter_62_0
							end
						end
					until var_62_0 ~= ""

					iniSet("KeyWindowPM", var_62_0)
					wait(1)
					sampCloseCurrentDialogWithButton(0)

					var_0_88.imgui_active3.v = true
				end)
			end

			var_0_6.Separator()
			var_0_6.Text(u8("Клавиша для промотки выведенного чата игровых помощников:"))
			var_0_6.SameLine()
			var_0_6.TextColoredRGB(u8("{FFE4B5}") .. var_0_76.tag.keyrenderchatsupports:gsub("VK_", "") .. u8("{FFFFFF} + колесико мыши"))

			if var_0_6.Button(u8("Сменить клавишу для промотки выведенного чата игровых помощников")) then
				var_0_88.imgui_active3.v = false

				sampShowDialog(12, "Смена клавиши", "Нажмите на нужную клавишу", "Выбрать", "Назад", 0)
				lua_thread.create(function()
					local var_63_0 = ""

					wait(100)

					repeat
						wait(0)

						for iter_63_0, iter_63_1 in pairs(var_0_2) do
							if wasKeyPressed(iter_63_1) and iter_63_0 ~= "VK_ESCAPE" and iter_63_0 ~= "VK_RETURN" and iter_63_0 ~= "RBUTTON" and iter_63_0 ~= "LBUTTON" then
								var_63_0 = iter_63_0
							end
						end
					until var_63_0 ~= ""

					iniSet("keyrenderchatsupports", var_63_0)
					wait(1)
					sampCloseCurrentDialogWithButton(0)

					var_0_88.imgui_active3.v = true
				end)
			end

			var_0_6.EndChild()
		end

		if var_0_64 == 4 then
			var_0_6.BeginChild("dom#1111", var_0_6.ImVec2(572, 30), true)
			var_0_6.PushStyleVar(var_0_6.StyleVar.FrameRounding, 6)

			if var_0_6.Button("" .. var_0_11.ICON_ARROW_LEFT) then
				var_0_64 = 0
				var_0_66 = true
			end

			var_0_6.SameLine()
			var_0_6.Text(u8("Support Helper | Samp-RP"))
			var_0_6.PopStyleVar(1)
			var_0_6.EndChild()
			var_0_6.BeginChild("dom#1112", var_0_6.ImVec2(572, 322), true)
			var_0_6.TextColoredRGB(u8("\t\t\t\t\t\t\t\t\t\t\t\t\t\t             {808080}» {EEE8AA}Шрифты {808080}«"))
			var_0_6.Separator()
			var_0_6.Text(u8("Вопрос на экране при вводе ответа"))
			var_0_6.SameLine()

			if var_0_6.ToggleButton("##8", var_0_88.active6) then
				-- block empty
			end

			if var_0_6.Button(u8("Сменить позицию вопроса на экране ")) and var_0_88.active6.v then
				sampAddChatMessage(var_0_13 .. " {FFFFFF}Для сохранения положения нажмите {ff004d}ПРОБЕЛ", 16776960)

				editingPos = true

				showCursor(true)

				var_0_88.imgui_active3.v = false
			end

			var_0_6.Separator()
			var_0_6.Text(u8("Кол-во строк в окне вопросов: "))
			var_0_6.SameLine()
			var_0_6.PushItemWidth(120)

			if var_0_6.SliderFloat("##per1", var_0_88.global_Line, 0, 100, "%.0f") and var_0_88.global_Line.v >= 1 and var_0_88.global_Line.v <= 100 then
				-- block empty
			end

			var_0_6.PopItemWidth()
			var_0_6.Text(u8("Размер текста в окне вопросов: "))
			var_0_6.SameLine()
			var_0_6.PushItemWidth(120)

			if var_0_6.SliderFloat("##per2", var_0_88.global_FontSize1, 0, 100, "%.0f") and var_0_88.global_FontSize1.v >= 1 and var_0_88.global_FontSize1.v <= 100 then
				-- block empty
			end

			var_0_6.PopItemWidth()
			var_0_6.Text(u8("Окно с вопросами"))
			var_0_6.SameLine()

			if var_0_6.ToggleButton("##9", var_0_88.active5) then
				-- block empty
			end

			if var_0_6.Button(u8("Сменить позицию окна с вопросами")) and var_0_88.active5.v then
				sampAddChatMessage(var_0_13 .. " {FFFFFF}Для сохранения положения нажмите {ff004d}ПРОБЕЛ", 16776960)

				editingPosP = true

				showCursor(true)

				var_0_88.imgui_active3.v = false
			end

			var_0_6.Separator()
			var_0_6.Text(u8("Шрифт текста: "))
			var_0_6.SameLine()
			var_0_6.PushItemWidth(120)
			var_0_6.InputText("##12123", var_0_88.FontName)
			var_0_6.SameLine()
			var_0_6.TextDisabled(u8("(?)"))

			if var_0_6.IsItemHovered() then
				var_0_6.BeginTooltip()
				var_0_6.TextUnformatted(u8("Шрифт который вы тут укажите должен быть установлен у вас на компьютере"))
				var_0_6.EndTooltip()
			end

			var_0_6.Text(u8("Размер текста: "))
			var_0_6.SameLine()
			var_0_6.PushItemWidth(120)

			if var_0_6.SliderFloat("##per3", var_0_88.global_FontSize, 0, 100, "%.0f") and var_0_88.global_FontSize.v >= 1 and var_0_88.global_FontSize.v <= 100 then
				-- block empty
			end

			var_0_6.PopItemWidth()
			var_0_6.Text(u8("Стиль текста: "))
			var_0_6.SameLine()
			var_0_6.PushItemWidth(120)

			if var_0_6.SliderFloat("##per4", var_0_88.global_FontFlag, 0, 100, "%.0f") and var_0_88.global_FontFlag.v >= 1 and var_0_88.global_FontFlag.v <= 100 then
				-- block empty
			end

			var_0_6.PopItemWidth()
			var_0_6.Text(u8("Цвет текста: "))
			var_0_6.SameLine()
			var_0_6.PushItemWidth(120)
			var_0_6.InputText("##123", var_0_88.color)
			var_0_6.SameLine()
			var_0_6.TextDisabled(u8("(?)"))

			if var_0_6.IsItemHovered() then
				var_0_6.BeginTooltip()
				var_0_6.TextUnformatted(u8("Цвет текста должен быть в формате HEX. Пример: FFFFFF"))
				var_0_6.EndTooltip()
			end

			var_0_6.Separator()
			var_0_6.PushStyleVar(var_0_6.StyleVar.ButtonTextAlign, var_0_6.ImVec2(0.5, 0.5))

			if var_0_6.Button("" .. var_0_11.ICON_FLOPPY_O .. u8(" Сохранить настройки")) then
				if #var_0_88.color.v:gsub(" ", "") == 6 then
					var_0_76.tag.activeAutoSduty = var_0_88.activeAutoSduty.v
					var_0_76.tag.active2 = var_0_88.active2.v
					var_0_76.tag.active3 = var_0_88.active3.v
					var_0_76.tag.active6 = var_0_88.active6.v
					var_0_76.tag.active5 = var_0_88.active5.v
					var_0_76.tag.color = var_0_88.color.v
					var_0_76.tag.SupportName = var_0_88.SupportName.v
					var_0_76.tag.FontName = var_0_88.FontName.v
					var_0_76.tag.global_FontSize = var_0_88.global_FontSize.v
					var_0_76.tag.global_FontFlag = var_0_88.global_FontFlag.v
					var_0_76.tag.global_FontSize1 = var_0_88.global_FontSize1.v
					var_0_76.tag.global_Line = var_0_88.global_Line.v
					var_0_76.tag.global_Line2 = var_0_88.global_Line2.v

					savesettings()

					font = renderCreateFont(var_0_76.tag.FontName, var_0_76.tag.global_FontSize, var_0_76.tag.global_FontFlag)
					font1 = renderCreateFont(var_0_76.tag.FontName, var_0_76.tag.global_FontSize1, var_0_76.tag.global_FontFlag)
					font2 = renderCreateFont(var_0_76.tag.FontName, var_0_76.tag.global_FontSize, var_0_76.tag.global_FontFlag)

					sampAddChatMessage(var_0_13 .. " {FFFFFF} Настройки скрипта успешно {FFA500}сохранены", 16776960)
				else
					sampAddChatMessage(var_0_13 .. " {FF0000}Ошибка! {FFFFFF}Сохранение не произошло. Цвет должен быть из 6 символов, пример: FFFFFF", 16776960)
				end
			end

			var_0_6.PopStyleVar(1)
			var_0_6.SameLine()
			var_0_6.TextDisabled(u8("(?)"))

			if var_0_6.IsItemHovered() then
				var_0_6.BeginTooltip()
				var_0_6.TextUnformatted(u8("Если после настройки какого либо парамератра / пункта / подпункта в этом окне\nвы не нажмете кнопку \"сохранить настройки\", то, изменения не вступят в силу"))
				var_0_6.EndTooltip()
			end

			var_0_6.EndChild()
		end

		var_0_6.End()
	end

	if var_0_88.imgui_active4.v then
		_, myID = sampGetPlayerIdByCharHandle(PLAYER_PED)
		myName = sampGetPlayerNickname(myID)
		var_0_6.ShowCursor = true

		var_0_6.SetNextWindowSize(var_0_6.ImVec2(1000, 600), var_0_6.Cond.Always)
		var_0_6.SetNextWindowPos(var_0_6.ImVec2(var_0_71 / 2, var_0_72 / 2), var_0_6.Cond.FirstUseEver, var_0_6.ImVec2(0.5, 0.5))
		var_0_6.Begin(var_0_11.ICON_CALENDAR_MINUS_O .. u8(" Support Helper - Счетчик онлайна"), var_0_88.imgui_active4, var_0_6.WindowFlags.NoResize + var_0_6.WindowFlags.NoCollapse + var_0_6.WindowFlags.NoMove)
		var_0_6.SameLine()
		var_0_6.TextDisabled(u8("Наведись курсором на данный текст - F.A.Q по счетчику"))

		if var_0_6.IsItemHovered() then
			var_0_6.BeginTooltip()
			var_0_6.TextUnformatted(u8("Время в AFK не учитывается\nОтображение времени онлайна идет без учета проведенного времени в AFK"))
			var_0_6.EndTooltip()
		end

		var_0_6.Separator()

		if sampGetGamestate() ~= 3 then
			var_0_6.TextColoredRGB(u8("Подключение: ") .. get_clock(connectingTime))
		else
			var_0_6.TextColoredRGB(u8("Онлайн за сессию: ") .. get_clock(var_0_88.sesOnline.v))
			var_0_6.TextColoredRGB(u8("Онлайн за день: ") .. get_clock(var_0_76.onDay.online))
			var_0_6.Separator()
			var_0_6.TextColoredRGB(u8("{0087FF}Онлайн за неделю: ") .. u8(get_clock(var_0_76.onWeek.online)), 2)
			var_0_6.NewLine()

			for iter_59_23 = 1, 6 do
				var_0_6.Text(u8(var_0_90[iter_59_23]))
				var_0_6.SameLine(250)
				var_0_6.Text(get_clock(var_0_76.myWeekOnline[iter_59_23]))
			end

			var_0_6.Text(u8(var_0_90[0]))
			var_0_6.SameLine(250)
			var_0_6.Text(get_clock(var_0_76.myWeekOnline[0]))
		end

		var_0_6.End()
	end

	if var_0_88.imgui_active5.v then
		_, myID = sampGetPlayerIdByCharHandle(PLAYER_PED)
		myName = sampGetPlayerNickname(myID)
		var_0_6.ShowCursor = true

		var_0_6.SetNextWindowSize(var_0_6.ImVec2(450, 275), var_0_6.Cond.FirstUseEver)
		var_0_6.SetNextWindowPos(var_0_6.ImVec2(var_0_71 / 2, var_0_72 / 2), var_0_6.Cond.Always, var_0_6.ImVec2(0.5, 0.5))
		var_0_6.Begin(var_0_11.ICON_FILE_TEXT_O .. u8(" Команды скрипта"), var_0_88.imgui_active5, var_0_6.WindowFlags.NoResize + var_0_6.WindowFlags.NoCollapse)

		if var_0_6.CollapsingHeader(u8("/shelper")) then
			var_0_6.TextColoredRGB(u8("{FFE4B5}Описание{FFFFFF}: Запустить главное меню скрипта"))
			var_0_6.Text("")
			var_0_6.TextColoredRGB(u8("{FFE4B5}Использование{FFFFFF}: /shelper"))
		end

		if var_0_6.CollapsingHeader(u8("/asupotv")) then
			var_0_6.TextColoredRGB(u8("{FFE4B5}Описание{FFFFFF}: Запустить меню счетчика ответов"))
			var_0_6.Text("")
			var_0_6.TextColoredRGB(u8("{FFE4B5}Использование{FFFFFF}: /shelpv"))
		end

		if var_0_6.CollapsingHeader(u8("/pmset")) then
			var_0_6.TextColoredRGB(u8("{FFE4B5}Описание{FFFFFF}: Запустить меню настройки быстрых ответов"))
			var_0_6.Text("")
			var_0_6.TextColoredRGB(u8("{FFE4B5}Использование{FFFFFF}: /pmset"))
		end

		if var_0_6.CollapsingHeader(u8("/pm [id]")) then
			var_0_6.TextColoredRGB(u8("{FFE4B5}Описание{FFFFFF}: Позволяет сделать быстрый ответ"))
			var_0_6.Text("")
			var_0_6.TextColoredRGB(u8("{FFE4B5}Использование{FFFFFF}: /pm [id] и жмете кнопку 'Enter'"))
		end

		if var_0_6.CollapsingHeader(u8("/hcost [ID дома] [ID человека]")) then
			var_0_6.TextColoredRGB(u8("{FFE4B5}Описание{FFFFFF}: Позволяет вывести информацию о доме в /pm"))
			var_0_6.Text("")
			var_0_6.TextColoredRGB(u8("{FFE4B5}Использование{FFFFFF}: /hcost [ID дома] [ID человека]"))
		end

		if var_0_6.CollapsingHeader(u8("/car [ID] [Название авто] [1 - если нужно указать цену со скидкой]")) then
			var_0_6.TextColoredRGB(u8("{FFE4B5}Описание{FFFFFF}: Позволяет вывести информацию о машине в PM\nПример использования команды: /car 23 nrg"))
			var_0_6.Text("")
			var_0_6.Text(u8("Если же вам надо указать цену авто со скидкой, то\nПример использования команды: /car 23 nrg 1"))
			var_0_6.Text("")
			var_0_6.TextColoredRGB(u8("{FFE4B5}Использование{FFFFFF}:\n/car [ID] [Название авто] [1 - если нужно указать цену со скидкой]"))
		end

		if var_0_6.CollapsingHeader(u8("/sleaders [ID] [Название организации]")) then
			var_0_6.TextColoredRGB(u8("{FFE4B5}Описание{FFFFFF}: Позволяет сделать быстрый поиск по лидерам\nИ далее вывести информацию в /pm\nМожно писать часть названия организации\nПример использования команды: /sleaders 12 grov"))
			var_0_6.Text("")
			var_0_6.TextColoredRGB(u8("{FFE4B5}Использование{FFFFFF}: /sleaders [ID] [Название организации]"))
		end

		if var_0_6.CollapsingHeader(u8("/sfarm [ID]")) then
			var_0_6.TextColoredRGB(u8("{FFE4B5}Описание{FFFFFF}: Позволяет вывести информацию о фермах в /pm"))
			var_0_6.Text("")
			var_0_6.TextColoredRGB(u8("{FFE4B5}Использование{FFFFFF}: /sfarm [ID]"))
		end

		if var_0_6.CollapsingHeader(u8("/skaz [ID]")) then
			var_0_6.TextColoredRGB(u8("{FFE4B5}Описание{FFFFFF}: Позволяет вывести информацию чье казино в /pm"))
			var_0_6.Text("")
			var_0_6.TextColoredRGB(u8("{FFE4B5}Использование{FFFFFF}: /skaz [ID]"))
		end

		if var_0_6.CollapsingHeader(u8("/sgps [ID] [Название gps]")) then
			var_0_6.TextColoredRGB(u8("{FFE4B5}Описание{FFFFFF}: Позволяет вывести информацию о /gps в /pm"))
			var_0_6.Text("")
			var_0_6.TextColoredRGB(u8("{FFE4B5}Использование{FFFFFF}: /sgps [ID] [Название gps]"))
		end

		if var_0_6.CollapsingHeader(u8("/skinid [ID] [ID скина]")) then
			var_0_6.TextColoredRGB(u8("{FFE4B5}Описание{FFFFFF}: Позволяет вывести информацию о скинах в /pm"))
			var_0_6.Text("")
			var_0_6.TextColoredRGB(u8("{FFE4B5}Использование{FFFFFF}: /skinid [ID] [ID скина]"))
		end

		if var_0_6.CollapsingHeader(u8("/lasup")) then
			var_0_6.TextColoredRGB(u8("{FFE4B5}Описание{FFFFFF}: Обновление счетчика информации на экране\nВо время обновления информации,\nигра может зависнуть на 3 - 15 секунд"))
			var_0_6.Text("")
			var_0_6.TextColoredRGB(u8("{FFE4B5}Использование{FFFFFF}: /lasup"))
		end

		var_0_6.End()
	end

	if var_0_88.window_12.v then
		local var_59_17 = sampGetInputInfoPtr()
		local var_59_18 = getStructElement(var_59_17, 8, 4)
		local var_59_19, var_59_20 = getStructElement(var_59_18, 8, 4), getStructElement(var_59_18, 12, 4) + 50

		var_0_6.SetNextWindowSize(var_0_6.ImVec2(80, 150), var_0_6.Cond.FirstUseEver)
		var_0_6.SetNextWindowPos(var_0_6.ImVec2(var_59_19, var_59_20), var_0_6.Cond.Always)
		var_0_6.Begin("#1221", var_0_88.window_12, var_0_6.WindowFlags.NoTitleBar + var_0_6.WindowFlags.NoResize + var_0_6.WindowFlags.AlwaysAutoResize + var_0_6.WindowFlags.NoMove + var_0_6.WindowFlags.NoFocusOnAppearing)

		if #var_0_65 ~= 0 then
			for iter_59_24 = 1, #var_0_65 do
				if var_0_6.Selectable("" .. var_0_65[iter_59_24]) then
					local var_59_21, var_59_22, var_59_23 = string.match(sampGetChatInputText(), "(/sgps) (%d+) (.+)")

					sampSetChatInputText(var_59_21 .. " " .. var_59_22 .. " " .. u8:decode(var_0_65[iter_59_24]) .. " ")

					var_0_88.window_12.v = false
				end
			end
		else
			var_0_6.Text(u8("Ничего не найдено"))
		end

		var_0_6.End()
	end
end

function save()
	var_0_76.pos.x, var_0_76.pos.y = var_0_80, var_0_81

	var_0_1.save(var_0_76, "SupportHelper\\SupportHelper.ini")
end

function savee()
	var_0_76.posT.xx, var_0_76.posT.yy = var_0_82, var_0_83

	var_0_1.save(var_0_76, "SupportHelper\\SH-settings.ini")
end

function savee2()
	var_0_76.posT1.xx, var_0_76.posT1.yy = var_0_84, var_0_85

	var_0_1.save(var_0_76, "SupportHelper\\SH-settings.ini")
end

function savee3()
	var_0_76.posT2.xx, var_0_76.posT2.yy = var_0_86, var_0_87

	var_0_1.save(var_0_76, "SupportHelper\\SH-settings.ini")
end

function getCommandParams(arg_68_0)
	local var_68_0 = {}

	for iter_68_0 in string.gmatch(arg_68_0, "[^ ]+ ?") do
		table.insert(var_68_0, iter_68_0)
	end

	return var_68_0
end

function savesettings()
	var_0_1.save(var_0_76, "SupportHelper\\SH-settings.ini")
end

function time()
	startTime = os.time()
	connectingTime = 0

	while true do
		wait(1000)

		local var_70_0, var_70_1 = sampGetPlayerIdByCharHandle(PLAYER_PED)

		nickname = sampGetPlayerNickname(var_70_1)

		if var_0_76.tag.SupportName == nickname and var_0_41 then
			var_0_89 = os.date("%H:%M:%S", os.time())

			if sampGetGamestate() == 3 then
				var_0_88.sesOnline.v = var_0_88.sesOnline.v + 1
				var_0_88.sesFull.v = os.time() - startTime
				var_0_88.sesAfk.v = var_0_88.sesFull.v - var_0_88.sesOnline.v
				var_0_76.onDay.online = var_0_76.onDay.online + 1
				var_0_76.onWeek.online = var_0_76.onWeek.online + 1

				local var_70_2 = tonumber(os.date("%w", os.time()))

				var_0_76.myWeekOnline[var_70_2] = var_0_76.onDay.online
				connectingTime = 0
			else
				connectingTime = connectingTime + 1
				startTime = startTime + 1
			end
		end
	end
end

function get_clock(arg_71_0)
	local var_71_0 = 86400 - os.date("%H", 0) * 3600

	if tonumber(arg_71_0) >= 86400 then
		onDay = true
	else
		onDay = false
	end

	return os.date((onDay and math.floor(arg_71_0 / 86400) .. "д " or "") .. "%H:%M:%S", arg_71_0 + var_71_0)
end

function autoSave()
	while true do
		wait(60000)

		local var_72_0, var_72_1 = sampGetPlayerIdByCharHandle(PLAYER_PED)

		nickname = sampGetPlayerNickname(var_72_1)

		if var_0_76.tag.SupportName == nickname and var_0_41 then
			var_0_1.save(var_0_76, "SupportHelper\\SH-settings.ini")
		end
	end
end

function onScriptTerminate(arg_73_0, arg_73_1)
	if arg_73_0 == thisScript() and not restart and var_0_1.save(var_0_76, "Support Helper\\SH-settings.ini") then
		sampfuncsLog("{FFFF00}[Support Helper]: {FFFFFF}Ваш онлайн сохранён!")
	end
end

function number_week()
	local var_74_0 = os.date("*t")
	local var_74_1 = os.time({
		month = 1,
		day = 1,
		year = var_74_0.year
	})
	local var_74_2 = (os.date("%w", var_74_1) - 1) % 7

	return math.ceil((var_74_0.yday + var_74_2) / 7)
end

function getStrDate(arg_75_0)
	local var_75_0 = {
		"января",
		"февраля",
		"марта",
		"апреля",
		"мая",
		"июня",
		"июля",
		"августа",
		"сентября",
		"октября",
		"ноября",
		"декабря"
	}
	local var_75_1 = tonumber(os.date("%d", arg_75_0))
	local var_75_2 = var_75_0[tonumber(os.date("%m", arg_75_0))]
	local var_75_3 = var_0_90[tonumber(os.date("%w", arg_75_0))]

	return string.format("%s, %s %s", var_75_3, var_75_1, var_75_2)
end

function sampGetPlayerIdByNickname(arg_76_0)
	local var_76_0, var_76_1 = sampGetPlayerIdByCharHandle(PLAYER_PED)

	if tostring(arg_76_0) == sampGetPlayerNickname(var_76_1) then
		return var_76_1
	end

	for iter_76_0 = 0, 1000 do
		if sampIsPlayerConnected(iter_76_0) and sampGetPlayerNickname(iter_76_0) == tostring(arg_76_0) then
			return iter_76_0
		end
	end

	return -1
end

function theme()
	local var_77_0 = var_0_6.GetStyle()
	local var_77_1 = var_77_0.Colors
	local var_77_2 = var_0_6.Col
	local var_77_3 = var_0_6.ImVec4

	var_77_0.WindowRounding = 9
	var_77_0.WindowTitleAlign = var_0_6.ImVec2(0.5, 0.5)
	var_77_0.ChildWindowRounding = 4
	var_77_0.FrameRounding = 3
	var_77_0.ItemSpacing = var_0_6.ImVec2(5, 4)
	var_77_0.ScrollbarSize = 13
	var_77_0.ScrollbarRounding = 0
	var_77_0.GrabMinSize = 8
	var_77_0.GrabRounding = 1
	var_77_0.WindowPadding = var_0_6.ImVec2(4, 4)
	var_77_0.FramePadding = var_0_6.ImVec2(3.5, 3.5)
	var_77_0.ButtonTextAlign = var_0_6.ImVec2(0, 0.5)
	var_77_1[var_77_2.Text] = var_77_3(1, 1, 1, 1)
	var_77_1[var_77_2.TextDisabled] = var_77_3(0.73, 0.75, 0.74, 1)
    var_77_1[var_77_2.WindowBg] = var_77_3(0.2, 0.2, 0.2, 0.85)
	var_77_1[var_77_2.ChildWindowBg] = var_77_3(10, 10, 10, 0.01)
	var_77_1[var_77_2.PopupBg] = var_77_3(0.08, 0.08, 0.08, 0.94)
	var_77_1[var_77_2.Border] = var_77_3(0.2, 0.2, 0.2, 0.5)
	var_77_1[var_77_2.BorderShadow] = var_77_3(0, 0, 0, 0)
    var_77_1[var_77_2.FrameBg] = var_77_3(0.2, 0.6, 0.2, 0.65)
    var_77_1[var_77_2.FrameBgHovered] = var_77_3(0.3, 0.8, 0.3, 1)
    var_77_1[var_77_2.FrameBgActive] = var_77_3(0.25, 0.7, 0.25, 1)
	var_77_1[var_77_2.TitleBg] = var_77_3(0, 0, 0, 1)
	var_77_1[var_77_2.TitleBgActive] = var_77_3(0, 0.24, 0.54, 1)
	var_77_1[var_77_2.TitleBgCollapsed] = var_77_3(0, 0.22, 1, 0.67)
	var_77_1[var_77_2.MenuBarBg] = var_77_3(0.08, 0.44, 1, 1)
	var_77_1[var_77_2.ScrollbarBg] = var_77_3(0.02, 0.02, 0.02, 0.53)
	var_77_1[var_77_2.ScrollbarGrab] = var_77_3(0.31, 0.31, 0.31, 1)
	var_77_1[var_77_2.ScrollbarGrabHovered] = var_77_3(0.41, 0.41, 0.41, 1)
	var_77_1[var_77_2.ScrollbarGrabActive] = var_77_3(0.51, 0.51, 0.51, 1)
	var_77_1[var_77_2.ComboBg] = var_77_3(0.2, 0.2, 0.2, 0.99)
	var_77_1[var_77_2.CheckMark] = var_77_3(1, 1, 1, 1)
	var_77_1[var_77_2.SliderGrab] = var_77_3(0.4, 0.8, 0.4, 0.95)
	var_77_1[var_77_2.SliderGrabActive] = var_77_3(0.84, 0.66, 0.66, 1)
	var_77_1[var_77_2.Button] = var_77_3(0, 0.39, 1, 0.65)
    var_77_1[var_77_2.ButtonHovered] = var_77_3(0.4, 0.8, 0.4, 0.95)
	var_77_1[var_77_2.ButtonActive] = var_77_3(0.7, 0.7, 0.7, 0.95)
	var_77_1[var_77_2.Button] = var_77_3(0.95, 0.85, 0.3, 0.85)
	var_77_1[var_77_2.HeaderHovered] = var_77_3(0, 0.36, 1, 0.65)
	var_77_1[var_77_2.HeaderActive] = var_77_3(0, 0.53, 1, 0)
	var_77_1[var_77_2.Separator] = var_77_3(0.43, 0.43, 0.5, 0.5)
	var_77_1[var_77_2.SeparatorHovered] = var_77_3(0.71, 0.39, 0.39, 0.54)
	var_77_1[var_77_2.SeparatorActive] = var_77_3(0.71, 0.39, 0.39, 0.54)
	var_77_1[var_77_2.ResizeGrip] = var_77_3(0.71, 0.39, 0.39, 0.54)
	var_77_1[var_77_2.ResizeGripHovered] = var_77_3(0.84, 0.66, 0.66, 0.66)
	var_77_1[var_77_2.ResizeGripActive] = var_77_3(0.84, 0.66, 0.66, 0.66)
	var_77_1[var_77_2.CloseButton] = var_77_3(0.41, 0.41, 0.41, 1)
	var_77_1[var_77_2.CloseButtonHovered] = var_77_3(0.98, 0.39, 0.36, 1)
	var_77_1[var_77_2.CloseButtonActive] = var_77_3(0.98, 0.39, 0.36, 1)
	var_77_1[var_77_2.PlotLines] = var_77_3(0.61, 0.61, 0.61, 1)
	var_77_1[var_77_2.PlotLinesHovered] = var_77_3(1, 0.43, 0.35, 1)
	var_77_1[var_77_2.PlotHistogram] = var_77_3(0.9, 0.7, 0, 1)
	var_77_1[var_77_2.PlotHistogramHovered] = var_77_3(1, 0.6, 0, 1)
	var_77_1[var_77_2.TextSelectedBg] = var_77_3(0.26, 0.59, 0.98, 0.35)
	var_77_1[var_77_2.ModalWindowDarkening] = var_77_3(0.8, 0.8, 0.8, 0.35)
end

theme()
function loadFaqDatabase()
    if doesFileExist(faqPath) then
        local file = io.open(faqPath, "r")

        if file then
            local content = file:read("*a")
            file:close()

            local success, result = pcall(function()
                return json.decode(content)
            end)

            if success and type(result) == "table" then
                faqDatabase = result
            else
                faqDatabase = {}
            end
        end
    end
end
function saveFaqDatabase()
    local file = io.open(faqPath, "w+")

    if file then
        file:write(json.encode(faqDatabase))
        file:close()
    end
end
function findSimilarAnswer(question)

	for _, item in ipairs(faqDatabase) do

		if item.question:lower() == question:lower() then
			return item.answer
		end
	end

	return nil
end
