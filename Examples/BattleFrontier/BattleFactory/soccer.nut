class Hissatsu {
    constructor(_name = "", _difficulty = "", _position = "", _crc32 = 0x0) {
        name = _name;
        difficulty = _difficulty;
		position = _position;
		crc32 = _crc32;
		level = 1;
    }
	
	name = "";
	difficulty = "";
	position = "";
	crc32 = 0x0;
	level = 1;
};

class Player {
    constructor(_name = "", _position = "") {
        name = _name;
		position = _position;
		hissatsus = [];
    }
	
	name = "";
	position = "";
	hissatsus = [];
};

// Défenses
defenses <- [
    Hissatsu("whd0001", "easy", "defense", 0x666E4699),
    Hissatsu("whd0002", "easy", "defense", 0xFF671723),
    Hissatsu("whd0003", "legend", "defense", 0x886027B5),
    Hissatsu("whd0004", "easy", "defense", 0x1604B216),
    Hissatsu("whd0005", "legend", "defense", 0x61038280),
    Hissatsu("whd0006", "hard", "defense", 0xF80AD33A),
    Hissatsu("whd0007", "easy", "defense", 0x8F0DE3AC),
    Hissatsu("whd0008", "easy", "defense", 0x1FB2FE3D),
    Hissatsu("whd0009", "legend", "defense", 0x68B5CEAB),
    Hissatsu("whd0010", "hard", "defense", 0x0872474E),
    Hissatsu("whd0011", "hard", "defense", 0x7F7577D8),
    Hissatsu("whd0012", "hard", "defense", 0xE67C2662),
    Hissatsu("whd0013", "hard", "defense", 0x917B16F4),
    Hissatsu("whd0014", "legend", "defense", 0x0F1F8357),
    Hissatsu("whd0015", "hard", "defense", 0x7818B3C1),
    Hissatsu("whd0016", "hard", "defense", 0xE111E27B),
    Hissatsu("whd0017", "legend", "defense", 0x9616D2ED),
    Hissatsu("whd0018", "legend", "defense", 0x06A9CF7C),
    Hissatsu("whd0019", "legend", "defense", 0x71AEFFEA),
    Hissatsu("whd0020", "hard", "defense", 0x235F148D),
    Hissatsu("whd0021", "legend", "defense", 0x5458241B),
    Hissatsu("whd0022", "legend", "defense", 0xCD5175A1),
    Hissatsu("whd0023", "hard", "defense", 0xBA564537),
];

// Saves
saves <- [
    Hissatsu("whk0001", "hard", "save", 0xE43ED148),
    Hissatsu("whk0002", "hard", "save", 0x7D3780F2),
    Hissatsu("whk0003", "easy", "save", 0x0A30B064),
    Hissatsu("whk0004", "hard", "save", 0x945425C7),
    Hissatsu("whk0005", "easy", "save", 0xE3531551),
    Hissatsu("whk0006", "hard", "save", 0x7A5A44EB),
    Hissatsu("whk0007", "hard", "save", 0x0D5D747D),
    Hissatsu("whk0008", "easy", "save", 0x9DE269EC),
    Hissatsu("whk0009", "easy", "save", 0xEAE5597A),
    Hissatsu("whk0010", "easy", "save", 0x8A22D09F),
    Hissatsu("whk0011", "legend", "save", 0xFD25E009),
    Hissatsu("whk0012", "easy", "save", 0x642CB1B3),
    Hissatsu("whk0013", "legend", "save", 0x132B8125),
    Hissatsu("whk0014", "legend", "save", 0x8D4F1486),
    Hissatsu("whk0015", "legend", "save", 0xFA482410),
    Hissatsu("whk0016", "legend", "save", 0x634175AA),
    Hissatsu("whk0017", "legend", "save", 0x1446453C),
    Hissatsu("whk0018", "legend", "save", 0x84F958AD),
];

// Dribbles
dribbles <- [
    Hissatsu("who0001", "hard", "dribble", 0x11BE7788),
    Hissatsu("who0002", "easy", "dribble", 0x88B72632),
    Hissatsu("who0003", "easy", "dribble", 0xFFB016A4),
    Hissatsu("who0004", "easy", "dribble", 0x61D48307),
    Hissatsu("who0005", "easy", "dribble", 0x16D3B391),
    Hissatsu("who0006", "hard", "dribble", 0x8FDAE22B),
    Hissatsu("who0007", "easy", "dribble", 0xF8DDD2BD),
    Hissatsu("who0008", "easy", "dribble", 0x6862CF2C),
    Hissatsu("who0009", "hard", "dribble", 0x1F65FFBA),
    Hissatsu("who0010", "hard", "dribble", 0x7FA2765F),
    Hissatsu("who0011", "easy", "dribble", 0x08A546C9),
    Hissatsu("who0012", "legend", "dribble", 0x91AC1773),
    Hissatsu("who0013", "easy", "dribble", 0xE6AB27E5),
    Hissatsu("who0014", "hard", "dribble", 0x78CFB246),
    Hissatsu("who0015", "hard", "dribble", 0x0FC882D0),
    Hissatsu("who0016", "hard", "dribble", 0x96C1D36A),
    Hissatsu("who0017", "legend", "dribble", 0xE1C6E3FC),
    Hissatsu("who0018", "legend", "dribble", 0x7179FE6D),
    Hissatsu("who0019", "legend", "dribble", 0x067ECEFB),
    Hissatsu("who0020", "legend", "dribble", 0x548F259C),
    Hissatsu("who0021", "legend", "dribble", 0x2388150A),
    Hissatsu("who0022", "legend", "dribble", 0xBA8144B0),
    Hissatsu("who0023", "hard", "dribble", 0xCD867426),
    Hissatsu("who0024", "hard", "dribble", 0x53E2E185),
];

// Skills
skills <- [
    Hissatsu("whp0001", "easy", "skill", 0xF30E77DB),
    Hissatsu("whp0002", "easy", "skill", 0x6A072661),
    Hissatsu("whp0003", "easy", "skill", 0x1D0016F7),
    Hissatsu("whp0004", "easy", "skill", 0x83648354),
    Hissatsu("whp0005", "easy", "skill", 0xF463B3C2),
    Hissatsu("whp0006", "easy", "skill", 0x6D6AE278),
    Hissatsu("whp0007", "easy", "skill", 0x1A6DD2EE),
    Hissatsu("whp0008", "easy", "skill", 0x8AD2CF7F),
    Hissatsu("whp0009", "easy", "skill", 0xFDD5FFE9),
    Hissatsu("whp0010", "easy", "skill", 0x9D12760C),
    Hissatsu("whp0011", "easy", "skill", 0xEA15469A),
    Hissatsu("whp0012", "easy", "skill", 0x731C1720),
    Hissatsu("whp0013", "easy", "skill", 0x041B27B6),
    Hissatsu("whp0014", "easy", "skill", 0x9A7FB215),
    Hissatsu("whp0015", "easy", "skill", 0xED788283),
    Hissatsu("whp0016", "easy", "skill", 0x7471D339),
    Hissatsu("whp0017", "easy", "skill", 0x0376E3AF),
    Hissatsu("whp0018", "easy", "skill", 0x93C9FE3E),
    Hissatsu("whp0019", "easy", "skill", 0xE4CECEA8),
    Hissatsu("whp0020", "easy", "skill", 0xB63F25CF),
    Hissatsu("whp0021", "easy", "skill", 0xC1381559),
    Hissatsu("whp0022", "easy", "skill", 0x583144E3),
    Hissatsu("whp0023", "easy", "skill", 0x2F367475),
    Hissatsu("whp0024", "easy", "skill", 0xB152E1D6),
    Hissatsu("whp0025", "easy", "skill", 0xC655D140),
    Hissatsu("whp0026", "easy", "skill", 0x5F5C80FA),
    Hissatsu("whp0027", "easy", "skill", 0x285BB06C),
    Hissatsu("whp0028", "easy", "skill", 0xB8E4ADFD),
    Hissatsu("whp0029", "easy", "skill", 0xCFE39D6B),
    Hissatsu("whp0030", "easy", "skill", 0xAF24148E),
    Hissatsu("whp0031", "easy", "skill", 0xD8232418),
    Hissatsu("whp0032", "easy", "skill", 0x412A75A2),
    Hissatsu("whp0033", "easy", "skill", 0x362D4534),
    Hissatsu("whp0034", "easy", "skill", 0xA849D097),
    Hissatsu("whp0035", "easy", "skill", 0xDF4EE001),
    Hissatsu("whp0036", "easy", "skill", 0x4647B1BB),
    Hissatsu("whp0037", "easy", "skill", 0x3140812D),
    Hissatsu("whp0038", "easy", "skill", 0xA1FF9CBC),
    Hissatsu("whp0039", "easy", "skill", 0xD6F8AC2A),
    Hissatsu("whp0040", "easy", "skill", 0xE0658249),
];

// Shoots
shoots <- [
    Hissatsu("whs0001", "hard", "shoot", 0xB4AE0D0B),
    Hissatsu("whs0002", "hard", "shoot", 0x2DA75CB1),
    Hissatsu("whs0003", "easy", "shoot", 0x5AA06C27),
    Hissatsu("whs0004", "easy", "shoot", 0xC4C4F984),
    Hissatsu("whs0005", "legend", "shoot", 0xB3C3C912),
    Hissatsu("whs0006", "legend", "shoot", 0x2ACA98A8),
    Hissatsu("whs0007", "easy", "shoot", 0x5DCDA83E),
    Hissatsu("whs0008", "legend", "shoot", 0xCD72B5AF),
    Hissatsu("whs0009", "easy", "shoot", 0xBA758539),
    Hissatsu("whs0010", "easy", "shoot", 0xDAB20CDC),
    Hissatsu("whs0011", "hard", "shoot", 0xADB53C4A),
    Hissatsu("whs0012", "hard", "shoot", 0x34BC6DF0),
    Hissatsu("whs0013", "legend", "shoot", 0x43BB5D66),
    Hissatsu("whs0014", "easy", "shoot", 0xDDDFC8C5),
    Hissatsu("whs0015", "easy", "shoot", 0xAAD8F853),
    Hissatsu("whs0016", "hard", "shoot" 0x33D1A9E9),
    Hissatsu("whs0017", "hard", "shoot", 0x44D6997F),
    Hissatsu("whs0018", "hard", "shoot", 0xD46984EE),
    Hissatsu("whs0019", "easy", "shoot" 0xA36EB478),
    Hissatsu("whs0020", "legend", "shoot" 0xF19F5F1F),
    Hissatsu("whs0021", "legend", "shoot", 0x86986F89),
    Hissatsu("whs0022", "hard", "shoot", 0x1F913E33),
    Hissatsu("whs0023", "easy", "shoot", 0x68960EA5),
    Hissatsu("whs0024", "legend", "shoot", 0xF6F29B06),
    Hissatsu("whs0025", "legend", "shoot", 0x81F5AB90),
    Hissatsu("whs0026", "legend", "shoot", 0x18FCFA2A),
	Hissatsu("whs0026", "legend", "shoot", 0xB2F532A1),
    Hissatsu("whs0027", "hard", "shoot", 0x6FFBCABC),
    Hissatsu("whs0028", "legend", "shoot", 0xFF44D72D),
    Hissatsu("whs0029", "hard", "shoot", 0x8843E7BB),
    Hissatsu("whs0030", "legend", "shoot", 0xE8846E5E),
    Hissatsu("whs0031", "legend", "shoot", 0x9F835EC8),
    Hissatsu("whs0032", "hard", "shoot", 0x068A0F72),
    Hissatsu("whs0033", "hard", "shoot", 0x718D3FE4),
    Hissatsu("whs0034", "hard", "shoot", 0xEFE9AA47),
    Hissatsu("whs0035", "legend", "shoot", 0x98EE9AD1),
	Hissatsu("whs0035", "legend", "shoot", 0x32E7525A),
];

players <- [
    Player("para_cp0001", "GK"),
    Player("para_cp0002", "DF"),
    Player("para_cp0003", "DF"),
    Player("para_cp0004", "DF"),
    Player("para_cp0005", "DF"),
    Player("para_cp0006", "MF"),
    Player("para_cp0007", "MF"),
    Player("para_cp0008", "MF"),
    Player("para_cp0009", "MF"),
    Player("para_cp0010", "FW"),
    Player("para_cp0011", "FW"),
    Player("para_cp0012", "MF"),
    Player("para_cp0013", "FW"),
    Player("para_cp0014", "DF"),
    Player("para_cp0015", "DF"),
    Player("para_cp0016", "MF"),
    Player("para_cp0017", "FW"),
    Player("para_cp0021", "GK"),
    Player("para_cp0022", "DF"),
    Player("para_cp0023", "DF"),
    Player("para_cp0024", "DF"),
    Player("para_cp0025", "DF"),
    Player("para_cp0026", "MF"),
    Player("para_cp0027", "MF"),
    Player("para_cp0028", "MF"),
    Player("para_cp0029", "MF"),
    Player("para_cp0030", "FW"),
    Player("para_cp0031", "FW"),
    Player("para_cp0032", "GK"),
    Player("para_cp0033", "DF"),
    Player("para_cp0034", "MF"),
    Player("para_cp0035", "MF"),
    Player("para_cp0036", "GK"),
    Player("para_cp0037", "MF"),
    Player("para_cp0038", "FW"),
    Player("para_cp0041", "GK"),
    Player("para_cp0042", "DF"),
    Player("para_cp0043", "DF"),
    Player("para_cp0044", "DF"),
    Player("para_cp0045", "DF"),
    Player("para_cp0046", "MF"),
    Player("para_cp0047", "MF"),
    Player("para_cp0048", "MF"),
    Player("para_cp0049", "FW"),
    Player("para_cp0051", "FW"),
    Player("para_cp0052", "GK"),
    Player("para_cp0053", "FW"),
    Player("para_cp0054", "MF"),
    Player("para_cp0055", "DF"),
    Player("para_cp0056", "MF"),
    Player("para_cp0061", "GK"),
    Player("para_cp0062", "DF"),
    Player("para_cp0063", "DF"),
    Player("para_cp0064", "DF"),
    Player("para_cp0065", "DF"),
    Player("para_cp0066", "MF"),
    Player("para_cp0067", "MF"),
    Player("para_cp0068", "MF"),
    Player("para_cp0069", "FW"),
    Player("para_cp0070", "MF"),
    Player("para_cp0071", "FW"),
    Player("para_cp0072", "GK"),
    Player("para_cp0073", "DF"),
    Player("para_cp0074", "MF"),
    Player("para_cp0075", "MF"),
    Player("para_cp0076", "FW"),
    Player("para_cp0081", "GK"),
    Player("para_cp0082", "DF"),
    Player("para_cp0083", "DF"),
    Player("para_cp0084", "DF"),
    Player("para_cp0085", "MF"),
    Player("para_cp0086", "MF"),
    Player("para_cp0087", "MF"),
    Player("para_cp0088", "MF"),
    Player("para_cp0089", "FW"),
    Player("para_cp0090", "FW"),
    Player("para_cp0091", "FW"),
    Player("para_cp0092", "GK"),
    Player("para_cp0093", "DF"),
    Player("para_cp0094", "DF"),
    Player("para_cp0095", "MF"),
    Player("para_cp0096", "FW"),
    Player("para_cp0101", "GK"),
    Player("para_cp0102", "DF"),
    Player("para_cp0103", "DF"),
    Player("para_cp0104", "DF"),
    Player("para_cp0105", "DF"),
    Player("para_cp0106", "MF"),
    Player("para_cp0107", "MF"),
    Player("para_cp0108", "MF"),
    Player("para_cp0109", "FW"),
    Player("para_cp0110", "FW"),
    Player("para_cp0111", "FW"),
    Player("para_cp0112", "GK"),
    Player("para_cp0113", "FW"),
    Player("para_cp0114", "MF"),
    Player("para_cp0115", "MF"),
    Player("para_cp0116", "DF"),
    Player("para_cp0121", "GK"),
    Player("para_cp0122", "DF"),
    Player("para_cp0123", "DF"),
    Player("para_cp0124", "DF"),
    Player("para_cp0125", "MF"),
    Player("para_cp0126", "MF"),
    Player("para_cp0127", "MF"),
    Player("para_cp0128", "DF"),
    Player("para_cp0129", "MF"),
    Player("para_cp0130", "FW"),
    Player("para_cp0131", "FW"),
    Player("para_cp0132", "GK"),
    Player("para_cp0133", "DF"),
    Player("para_cp0134", "DF"),
    Player("para_cp0135", "FW"),
    Player("para_cp0136", "MF"),
    Player("para_cp0141", "GK"),
    Player("para_cp0142", "DF"),
    Player("para_cp0143", "DF"),
    Player("para_cp0144", "DF"),
    Player("para_cp0145", "DF"),
    Player("para_cp0146", "MF"),
    Player("para_cp0147", "MF"),
    Player("para_cp0148", "MF"),
    Player("para_cp0149", "MF"),
    Player("para_cp0150", "FW"),
    Player("para_cp0151", "FW"),
    Player("para_cp0152", "GK"),
    Player("para_cp0153", "MF"),
    Player("para_cp0154", "DF"),
    Player("para_cp0155", "DF"),
    Player("para_cp0156", "FW"),
    Player("para_cp0161", "GK"),
    Player("para_cp0162", "DF"),
    Player("para_cp0163", "DF"),
    Player("para_cp0164", "DF"),
    Player("para_cp0165", "DF"),
    Player("para_cp0166", "MF"),
    Player("para_cp0167", "MF"),
    Player("para_cp0168", "MF"),
    Player("para_cp0170", "FW"),
    Player("para_cp0171", "FW"),
    Player("para_cp0172", "GK"),
    Player("para_cp0173", "DF"),
    Player("para_cp0174", "DF"),
    Player("para_cp0175", "FW"),
    Player("para_cp0176", "FW"),
    Player("para_cp0201", "GK"),
    Player("para_cp0202", "DF"),
    Player("para_cp0203", "DF"),
    Player("para_cp0204", "DF"),
    Player("para_cp0205", "DF"),
    Player("para_cp0206", "MF"),
    Player("para_cp0207", "MF"),
    Player("para_cp0208", "MF"),
    Player("para_cp0209", "MF"),
    Player("para_cp0210", "FW"),
    Player("para_cp0211", "FW"),
    Player("para_cp0212", "GK"),
    Player("para_cp0213", "DF"),
    Player("para_cp0214", "MF"),
    Player("para_cp0215", "MF"),
    Player("para_cp0216", "FW"),
    Player("para_cp0221", "GK"),
    Player("para_cp0222", "DF"),
    Player("para_cp0223", "DF"),
    Player("para_cp0224", "DF"),
    Player("para_cp0225", "DF"),
    Player("para_cp0226", "MF"),
    Player("para_cp0227", "MF"),
    Player("para_cp0228", "MF"),
    Player("para_cp0229", "MF"),
    Player("para_cp0230", "FW"),
    Player("para_cp0231", "FW"),
    Player("para_cp0232", "GK"),
    Player("para_cp0233", "FW"),
    Player("para_cp0234", "FW"),
    Player("para_cp0235", "DF"),
    Player("para_cp0236", "MF"),
    Player("para_cp0241", "GK"),
    Player("para_cp0242", "DF"),
    Player("para_cp0243", "DF"),
    Player("para_cp0244", "DF"),
    Player("para_cp0245", "DF"),
    Player("para_cp0246", "MF"),
    Player("para_cp0247", "MF"),
    Player("para_cp0248", "MF"),
    Player("para_cp0249", "MF"),
    Player("para_cp0250", "FW"),
    Player("para_cp0251", "FW"),
    Player("para_cp0252", "GK"),
    Player("para_cp0253", "DF"),
    Player("para_cp0254", "MF"),
    Player("para_cp0255", "FW"),
    Player("para_cp0256", "FW"),
    Player("para_cp0281", "GK"),
    Player("para_cp0282", "DF"),
    Player("para_cp0283", "DF"),
    Player("para_cp0284", "DF"),
    Player("para_cp0285", "DF"),
    Player("para_cp0286", "MF"),
    Player("para_cp0287", "MF"),
    Player("para_cp0288", "MF"),
    Player("para_cp0289", "MF"),
    Player("para_cp0290", "FW"),
    Player("para_cp0291", "FW"),
    Player("para_cp0292", "GK"),
    Player("para_cp0293", "FW"),
    Player("para_cp0294", "MF"),
    Player("para_cp0295", "DF"),
    Player("para_cp0296", "DF"),
    Player("para_cp0301", "GK"),
    Player("para_cp0302", "DF"),
    Player("para_cp0303", "DF"),
    Player("para_cp0304", "DF"),
    Player("para_cp0305", "DF"),
    Player("para_cp0306", "MF"),
    Player("para_cp0307", "MF"),
    Player("para_cp0308", "MF"),
    Player("para_cp0309", "MF"),
    Player("para_cp0310", "FW"),
    Player("para_cp0311", "FW"),
    Player("para_cp0312", "GK"),
    Player("para_cp0313", "DF"),
    Player("para_cp0314", "MF"),
    Player("para_cp0315", "FW"),
    Player("para_cp0316", "MF"),
    Player("para_cp0321", "GK"),
    Player("para_cp0322", "DF"),
    Player("para_cp0323", "DF"),
    Player("para_cp0324", "MF"),
    Player("para_cp0325", "MF"),
    Player("para_cp0326", "MF"),
    Player("para_cp0327", "FW"),
    Player("para_cp0328", "FW"),
    Player("para_cp0329", "MF"),
    Player("para_cp0330", "FW"),
    Player("para_cp0331", "FW"),
    Player("para_cp0332", "GK"),
    Player("para_cp0333", "MF"),
    Player("para_cp0334", "FW"),
    Player("para_cp0335", "MF"),
    Player("para_cp0336", "DF"),
    Player("para_cp0341", "GK"),
    Player("para_cp0342", "DF"),
    Player("para_cp0343", "DF"),
    Player("para_cp0344", "DF"),
    Player("para_cp0345", "DF"),
    Player("para_cp0346", "MF"),
    Player("para_cp0347", "MF"),
    Player("para_cp0348", "MF"),
    Player("para_cp0349", "MF"),
    Player("para_cp0350", "FW"),
    Player("para_cp0351", "FW"),
    Player("para_cp0361", "GK"),
    Player("para_cp0362", "DF"),
    Player("para_cp0363", "DF"),
    Player("para_cp0364", "DF"),
    Player("para_cp0365", "DF"),
    Player("para_cp0366", "MF"),
    Player("para_cp0367", "MF"),
    Player("para_cp0368", "MF"),
    Player("para_cp0369", "MF"),
    Player("para_cp0370", "FW"),
    Player("para_cp0371", "FW"),
    Player("para_cp0381", "GK"),
    Player("para_cp0382", "DF"),
    Player("para_cp0383", "DF"),
    Player("para_cp0384", "DF"),
    Player("para_cp0385", "DF"),
    Player("para_cp0386", "MF"),
    Player("para_cp0387", "MF"),
    Player("para_cp0388", "MF"),
    Player("para_cp0389", "MF"),
    Player("para_cp0390", "FW"),
    Player("para_cp0391", "FW"),
    Player("para_cp0401", "GK"),
    Player("para_cp0402", "MF"),
    Player("para_cp0403", "DF"),
    Player("para_cp0404", "DF"),
    Player("para_cp0405", "DF"),
    Player("para_cp0406", "MF"),
    Player("para_cp0407", "MF"),
    Player("para_cp0408", "MF"),
    Player("para_cp0409", "DF"),
    Player("para_cp0410", "FW"),
    Player("para_cp0411", "FW"),
    Player("para_cp0412", "GK"),
    Player("para_cp0413", "DF"),
    Player("para_cp0414", "MF"),
    Player("para_cp0415", "DF"),
    Player("para_cp0416", "FW"),
    Player("para_cp0421", "GK"),
    Player("para_cp0422", "DF"),
    Player("para_cp0423", "DF"),
    Player("para_cp0424", "DF"),
    Player("para_cp0425", "DF"),
    Player("para_cp0426", "MF"),
    Player("para_cp0427", "MF"),
    Player("para_cp0428", "FW"),
    Player("para_cp0429", "MF"),
    Player("para_cp0430", "MF"),
    Player("para_cp0431", "FW"),
    Player("para_cp0432", "GK"),
    Player("para_cp0433", "DF"),
    Player("para_cp0434", "MF"),
    Player("para_cp0435", "FW"),
    Player("para_cp0436", "DF"),
    Player("para_cp0441", "MF"),
    Player("para_cp0442", "MF"),
    Player("para_cp0443", "FW"),
    Player("para_cp0444", "DF"),
    Player("para_cp0445", "DF"),
    Player("para_cp0446", "GK"),
    Player("para_cp0461", "GK"),
    Player("para_cp1001", "FW"),
    Player("para_cp1002", "GK"),
    Player("para_cp1003", "DF"),
    Player("para_cp1004", "DF"),
    Player("para_cp1005", "FW"),
    Player("para_cp1006", "FW"),
    Player("para_cp1007", "MF"),
    Player("para_cp1008", "FW"),
    Player("para_cp1009", "MF"),
    Player("para_cp1010", "DF"),
    Player("para_cp1011", "GK"),
    Player("para_cp1012", "FW"),
    Player("para_cp1013", "GK"),
    Player("para_cp1014", "DF"),
    Player("para_cp1015", "MF"),
    Player("para_cp1016", "FW"),
    Player("para_cp1017", "MF"),
    Player("para_cp1018", "FW"),
    Player("para_cp1019", "DF"),
    Player("para_cp1020", "DF"),
    Player("para_cp1021", "FW"),
    Player("para_cp1022", "MF"),
    Player("para_cp1023", "DF"),
    Player("para_cp1024", "DF"),
    Player("para_cp1025", "GK"),
    Player("para_cp1026", "FW"),
    Player("para_cp1027", "DF"),
    Player("para_cp1028", "MF"),
    Player("para_cp1029", "MF"),
    Player("para_cp1030", "MF"),
    Player("para_cp1031", "GK"),
    Player("para_cp1032", "MF"),
    Player("para_cp1033", "MF"),
    Player("para_cp1034", "DF"),
    Player("para_cp1035", "FW"),
    Player("para_cp1036", "FW"),
    Player("para_cp1037", "MF"),
    Player("para_cp1038", "GK"),
    Player("para_cp1039", "DF"),
    Player("para_cp1040", "FW"),
    Player("para_cp1041", "MF"),
    Player("para_cp1042", "MF"),
    Player("para_cp1043", "GK"),
    Player("para_cp1044", "DF"),
    Player("para_cp1045", "FW"),
    Player("para_cp1046", "MF"),
    Player("para_cp1047", "DF"),
    Player("para_cp1048", "FW"),
    Player("para_cp1049", "GK"),
    Player("para_cp1050", "DF"),
    Player("para_cp1051", "FW"),
    Player("para_cp1052", "FW"),
    Player("para_cp1053", "GK"),
    Player("para_cp1054", "MF"),
    Player("para_cp1055", "DF"),
    Player("para_cp1056", "DF"),
    Player("para_cp1057", "FW"),
    Player("para_cp1058", "GK"),
    Player("para_cp1059", "MF"),
    Player("para_cp1060", "MF"),
    Player("para_cp1061", "GK"),
    Player("para_cp1062", "FW"),
    Player("para_cp1063", "MF"),
    Player("para_cp1064", "DF"),
    Player("para_cp1065", "FW"),
    Player("para_cp1066", "MF"),
    Player("para_cp1067", "GK"),
    Player("para_cp1068", "DF"),
    Player("para_cp1069", "FW"),
    Player("para_cp1070", "MF"),
    Player("para_cp1071", "DF"),
    Player("para_cp1072", "FW"),
    Player("para_cp1073", "MF"),
    Player("para_cp1074", "FW"),
    Player("para_cp1075", "DF"),
    Player("para_cp1076", "DF"),
    Player("para_cp1077", "GK"),
    Player("para_cp1078", "GK"),
    Player("para_cp1079", "GK"),
    Player("para_cp1080", "DF"),
    Player("para_cp1081", "FW"),
    Player("para_cp1082", "FW"),
    Player("para_cp1083", "MF"),
    Player("para_cp1084", "DF"),
    Player("para_cp1085", "GK"),
    Player("para_cp1086", "DF"),
    Player("para_cp1087", "DF"),
    Player("para_cp1088", "MF"),
    Player("para_cp1089", "FW"),
    Player("para_cp1090", "FW"),
    Player("para_cp1091", "GK"),
    Player("para_cp1092", "DF"),
    Player("para_cp1093", "FW"),
    Player("para_cp1094", "MF"),
    Player("para_cp1095", "FW"),
    Player("para_cp1096", "MF"),
    Player("para_cp1097", "FW"),
    Player("para_cp1098", "GK"),
    Player("para_cp1099", "MF"),
    Player("para_cp1100", "DF"),
    Player("para_cp1101", "FW"),
    Player("para_cp1102", "FW"),
    Player("para_cp1103", "GK"),
    Player("para_cp1104", "DF"),
    Player("para_cp1105", "FW"),
    Player("para_cp1106", "MF"),
    Player("para_cp1107", "DF"),
    Player("para_cp1108", "MF"),
    Player("para_cp1109", "GK"),
    Player("para_cp1110", "DF"),
    Player("para_cp1111", "FW"),
    Player("para_cp1112", "MF"),
    Player("para_cp1113", "FW"),
    Player("para_cp1114", "MF"),
    Player("para_cp1115", "GK"),
    Player("para_cp1116", "FW"),
    Player("para_cp1117", "MF"),
    Player("para_cp1118", "DF"),
    Player("para_cp1119", "DF"),
    Player("para_cp1120", "DF"),
    Player("para_cp1121", "GK"),
    Player("para_cp1122", "FW"),
    Player("para_cp1123", "MF"),
    Player("para_cp1124", "DF"),
    Player("para_cp1125", "DF"),
    Player("para_cp1126", "DF"),
    Player("para_cp1127", "GK"),
    Player("para_cp1128", "FW"),
    Player("para_cp1129", "MF"),
    Player("para_cp1130", "DF"),
    Player("para_cp1131", "FW"),
    Player("para_cp1132", "DF"),
    Player("para_cp1133", "MF"),
    Player("para_cp1134", "DF"),
    Player("para_cp1135", "MF"),
    Player("para_cp1136", "FW"),
    Player("para_cp1137", "GK"),
    Player("para_cp1138", "FW"),
    Player("para_cp1139", "GK"),
    Player("para_cp1140", "DF"),
    Player("para_cp1141", "FW"),
    Player("para_cp1142", "MF"),
    Player("para_cp1143", "DF"),
    Player("para_cp1144", "GK"),
    Player("para_cp1145", "MF"),
    Player("para_cp1146", "DF"),
    Player("para_cp1147", "GK"),
    Player("para_cp1148", "DF"),
    Player("para_cp1149", "FW"),
    Player("para_cp1150", "FW"),
    Player("para_cp1151", "GK"),
    Player("para_cp1152", "FW"),
    Player("para_cp1153", "MF"),
    Player("para_cp1154", "DF"),
    Player("para_cp1155", "MF"),
    Player("para_cp1156", "MF"),
    Player("para_cp1157", "DF"),
    Player("para_cp1158", "FW"),
    Player("para_cp1159", "DF"),
    Player("para_cp1160", "MF"),
    Player("para_cp1161", "DF"),
    Player("para_cp1162", "GK"),
    Player("para_cp1163", "GK"),
    Player("para_cp1164", "FW"),
    Player("para_cp1165", "FW"),
    Player("para_cp1166", "DF"),
    Player("para_cp1167", "MF"),
    Player("para_cp1168", "DF"),
    Player("para_cp1169", "FW"),
    Player("para_cp1170", "DF"),
    Player("para_cp1171", "MF"),
    Player("para_cp1172", "MF"),
    Player("para_cp1173", "GK"),
    Player("para_cp1174", "MF"),
    Player("para_cp1175", "FW"),
    Player("para_cp1176", "GK"),
    Player("para_cp1177", "MF"),
    Player("para_cp1178", "DF"),
    Player("para_cp1179", "MF"),
    Player("para_cp1180", "DF"),
    Player("para_cp1181", "FW"),
    Player("para_cp1182", "MF"),
    Player("para_cp1183", "GK"),
    Player("para_cp1184", "DF"),
    Player("para_cp1185", "MF"),
    Player("para_cp1186", "MF"),
    Player("para_cp1187", "GK"),
    Player("para_cp1188", "DF"),
    Player("para_cp1189", "MF"),
    Player("para_cp1190", "MF"),
    Player("para_cp1191", "DF"),
    Player("para_cp1192", "FW"),
    Player("para_cp1193", "FW"),
    Player("para_cp1194", "GK"),
    Player("para_cp1195", "DF"),
    Player("para_cp1196", "DF"),
    Player("para_cp1197", "DF"),
    Player("para_cp1198", "GK"),
    Player("para_cp1199", "MF"),
    Player("para_cp1200", "GK"),
    Player("para_cp1201", "DF"),
    Player("para_cp1202", "DF"),
    Player("para_cp1203", "FW"),
    Player("para_cp1204", "DF"),
    Player("para_cp1205", "GK"),
    Player("para_cp1206", "MF"),
    Player("para_cp1207", "DF"),
    Player("para_cp1208", "MF"),
    Player("para_cp1209", "FW"),
    Player("para_cp1210", "GK"),
    Player("para_cp1211", "FW"),
    Player("para_cp1212", "GK"),
    Player("para_cp1213", "MF"),
    Player("para_cp1214", "DF"),
    Player("para_cp1215", "FW"),
    Player("para_cp1216", "DF"),
    Player("para_cp1217", "MF"),
    Player("para_cp1218", "DF"),
    Player("para_cp1219", "GK"),
    Player("para_cp1220", "FW"),
    Player("para_cp1221", "FW"),
    Player("para_cp1222", "FW"),
    Player("para_cp1223", "FW"),
    Player("para_cp1224", "MF"),
    Player("para_cp1225", "MF"),
    Player("para_cp1226", "DF"),
    Player("para_cp1227", "DF"),
    Player("para_cp1228", "GK"),
    Player("para_cp1229", "GK"),
    Player("para_cp1230", "MF"),
    Player("para_cp1231", "MF"),
    Player("para_cp1232", "MF"),
    Player("para_cp1233", "DF"),
    Player("para_cp1234", "DF"),
    Player("para_cp1235", "GK"),
    Player("para_cp1236", "DF"),
    Player("para_cp1237", "DF"),
    Player("para_cp1238", "FW"),
    Player("para_cp1239", "FW"),
    Player("para_cp1240", "MF"),
    Player("para_cp1241", "GK"),
    Player("para_cp1242", "GK"),
    Player("para_cp1243", "DF"),
    Player("para_cp1244", "MF"),
    Player("para_cp1245", "FW"),
    Player("para_cp1246", "MF"),
    Player("para_cp1247", "GK"),
    Player("para_cp1248", "DF"),
    Player("para_cp1249", "DF"),
    Player("para_cp1250", "MF"),
    Player("para_cp1251", "FW"),
    Player("para_cp1252", "FW"),
    Player("para_cp1253", "FW"),
    Player("para_cp1254", "GK"),
    Player("para_cp1255", "DF"),
    Player("para_cp1256", "DF"),
    Player("para_cp1257", "MF"),
    Player("para_cp1258", "MF"),
    Player("para_cp1259", "GK"),
    Player("para_cp1260", "MF"),
    Player("para_cp1261", "DF"),
    Player("para_cp1262", "FW"),
    Player("para_cp1263", "MF"),
    Player("para_cp1264", "FW"),
    Player("para_cp1265", "FW"),
    Player("para_cp1266", "GK"),
    Player("para_cp1267", "DF"),
    Player("para_cp1268", "MF"),
    Player("para_cp1269", "MF"),
    Player("para_cp1270", "MF"),
    Player("para_cp1271", "FW"),
    Player("para_cp1272", "DF"),
    Player("para_cp1273", "MF"),
    Player("para_cp1274", "GK"),
    Player("para_cp1275", "MF"),
    Player("para_cp1276", "GK"),
    Player("para_cp1277", "FW"),
    Player("para_cp1278", "DF"),
    Player("para_cp1279", "GK"),
    Player("para_cp1280", "FW"),
    Player("para_cp1281", "MF"),
    Player("para_cp1282", "DF"),
    Player("para_cp1283", "FW"),
    Player("para_cp1284", "MF"),
    Player("para_cp1285", "DF"),
    Player("para_cp1286", "FW"),
    Player("para_cp1287", "DF"),
    Player("para_cp1288", "GK"),
    Player("para_cp1289", "MF"),
    Player("para_cp1290", "FW"),
    Player("para_cp1291", "GK"),
    Player("para_cp1292", "MF"),
    Player("para_cp1293", "DF"),
    Player("para_cp1294", "FW"),
    Player("para_cp1295", "MF"),
    Player("para_cp1296", "DF"),
    Player("para_cp1297", "MF"),
    Player("para_cp1298", "GK"),
    Player("para_cp1299", "FW"),
    Player("para_cp1300", "MF"),
    Player("para_cp1301", "DF"),
    Player("para_cp1302", "DF"),
    Player("para_cp1303", "DF"),
    Player("para_cp1304", "MF"),
    Player("para_cp1305", "GK"),
    Player("para_cp1306", "FW"),
    Player("para_cp1307", "GK"),
    Player("para_cp1308", "FW"),
    Player("para_cp1309", "FW"),
    Player("para_cp1310", "GK"),
    Player("para_cp1311", "DF"),
    Player("para_cp1312", "DF"),
    Player("para_cp1313", "MF"),
    Player("para_cp1314", "GK"),
    Player("para_cp1315", "GK"),
    Player("para_cp1316", "DF"),
    Player("para_cp1317", "MF"),
    Player("para_cp1318", "FW"),
    Player("para_cp1319", "MF"),
    Player("para_cp1320", "GK"),
    Player("para_cp1321", "MF"),
    Player("para_cp1322", "FW"),
    Player("para_cp1323", "DF"),
    Player("para_cp1324", "MF"),
    Player("para_cp1325", "MF"),
    Player("para_cp1326", "GK"),
    Player("para_cp1327", "DF"),
    Player("para_cp1328", "FW"),
    Player("para_cp1329", "FW"),
    Player("para_cp1330", "GK"),
    Player("para_cp1331", "DF"),
    Player("para_cp1332", "FW"),
    Player("para_cp1333", "FW"),
    Player("para_cp1334", "GK"),
    Player("para_cp1335", "MF"),
    Player("para_cp1336", "DF"),
    Player("para_cp1337", "MF"),
    Player("para_cp1338", "GK"),
    Player("para_cp1339", "FW"),
    Player("para_cp1340", "FW"),
    Player("para_cp1341", "GK"),
    Player("para_cp1342", "MF"),
    Player("para_cp1343", "DF"),
    Player("para_cp1344", "FW"),
    Player("para_cp1345", "GK"),
    Player("para_cp1346", "DF"),
    Player("para_cp1347", "DF"),
    Player("para_cp1348", "FW"),
    Player("para_cp1349", "MF"),
    Player("para_cp1350", "FW"),
    Player("para_cp1351", "GK"),
    Player("para_cp1352", "FW"),
    Player("para_cp1353", "MF"),
    Player("para_cp1354", "DF"),
    Player("para_cp1355", "DF"),
    Player("para_cp1356", "GK"),
    Player("para_cp1357", "GK"),
    Player("para_cp1358", "FW"),
    Player("para_cp1359", "GK"),
    Player("para_cp1360", "MF"),
    Player("para_cp1361", "MF"),
    Player("para_cp1362", "DF"),
    Player("para_cp1363", "DF"),
    Player("para_cp1364", "GK"),
    Player("para_cp1365", "MF"),
    Player("para_cp1366", "MF"),
    Player("para_cp1367", "DF"),
    Player("para_cp1368", "DF"),
    Player("para_cp1369", "FW"),
    Player("para_cp1370", "FW"),
    Player("para_cp1371", "FW"),
    Player("para_cp1372", "FW"),
    Player("para_cp1373", "DF"),
    Player("para_cp1374", "MF"),
    Player("para_cp1375", "GK"),
    Player("para_cp1376", "GK"),
    Player("para_cp1377", "DF"),
    Player("para_cp1378", "MF"),
    Player("para_cp1379", "MF"),
    Player("para_cp1380", "FW"),
    Player("para_cp1381", "FW"),
    Player("para_cp1382", "FW"),
    Player("para_cp1383", "GK"),
    Player("para_cp1384", "DF"),
    Player("para_cp1385", "MF"),
    Player("para_cp1386", "FW"),
    Player("para_cp1387", "MF"),
    Player("para_cp1388", "FW"),
    Player("para_cp1389", "DF"),
    Player("para_cp1390", "DF"),
    Player("para_cp1391", "GK"),
    Player("para_cp1392", "DF"),
    Player("para_cp1393", "DF"),
    Player("para_cp1394", "FW"),
    Player("para_cp1395", "MF"),
    Player("para_cp1396", "MF"),
    Player("para_cp1397", "GK"),
    Player("para_cp1398", "GK"),
    Player("para_cp1399", "DF"),
    Player("para_cp1400", "MF"),
    Player("para_cp1401", "FW"),
    Player("para_cp1402", "FW"),
    Player("para_cp1403", "FW"),
    Player("para_cp1404", "GK"),
    Player("para_cp1405", "MF"),
    Player("para_cp1406", "DF"),
    Player("para_cp1407", "DF"),
    Player("para_cp1408", "FW"),
    Player("para_cp1409", "FW"),
    Player("para_cp1410", "DF"),
    Player("para_cp1411", "DF"),
    Player("para_cp1412", "GK"),
    Player("para_cp1413", "FW"),
    Player("para_cp1414", "MF"),
    Player("para_cp1415", "MF"),
    Player("para_cp1416", "DF"),
    Player("para_cp1417", "FW"),
    Player("para_cp1418", "MF"),
    Player("para_cp1419", "GK"),
    Player("para_cp1420", "MF"),
    Player("para_cp1421", "MF"),
    Player("para_cp1422", "FW"),
    Player("para_cp1423", "FW"),
    Player("para_cp1424", "GK"),
    Player("para_cp1425", "DF"),
    Player("para_cp1426", "FW"),
    Player("para_cp1427", "GK"),
    Player("para_cp1428", "DF"),
    Player("para_cp1429", "MF"),
    Player("para_cp1430", "DF"),
    Player("para_cp1431", "DF"),
    Player("para_cp1432", "FW"),
    Player("para_cp1433", "GK"),
    Player("para_cp1434", "MF"),
    Player("para_cp1435", "MF"),
    Player("para_cp1436", "DF"),
    Player("para_cp1437", "GK"),
    Player("para_cp1438", "GK"),
    Player("para_cp1439", "DF"),
    Player("para_cp1440", "DF"),
    Player("para_cp1441", "FW"),
    Player("para_cp1442", "MF"),
    Player("para_cp1443", "FW"),
    Player("para_cp1444", "GK"),
    Player("para_cp1445", "DF"),
    Player("para_cp1446", "DF"),
    Player("para_cp1447", "MF"),
    Player("para_cp1448", "GK"),
    Player("para_cp1449", "MF"),
    Player("para_cp1450", "FW"),
    Player("para_cp1451", "DF"),
    Player("para_cp1452", "DF"),
    Player("para_cp1453", "GK"),
    Player("para_cp1454", "GK"),
    Player("para_cp1455", "FW"),
    Player("para_cp1456", "DF"),
    Player("para_cp1457", "FW"),
    Player("para_cp1458", "MF"),
    Player("para_cp1459", "DF"),
    Player("para_cp1460", "GK"),
    Player("para_cp1461", "DF"),
    Player("para_cp1462", "DF"),
    Player("para_cp1463", "DF"),
    Player("para_cp1464", "MF"),
    Player("para_cp1465", "MF"),
    Player("para_cp1466", "GK"),
    Player("para_cp1467", "DF"),
    Player("para_cp1468", "DF"),
    Player("para_cp1469", "FW"),
    Player("para_cp1470", "MF"),
    Player("para_cp1471", "MF"),
    Player("para_cp1472", "GK"),
    Player("para_cp1473", "DF"),
    Player("para_cp1474", "DF"),
    Player("para_cp1475", "MF"),
    Player("para_cp1476", "FW"),
    Player("para_cp1477", "FW"),
    Player("para_cp1478", "GK"),
    Player("para_cp1479", "DF"),
    Player("para_cp1480", "FW"),
    Player("para_cp1481", "MF"),
    Player("para_cp1482", "MF"),
    Player("para_cp1483", "MF"),
    Player("para_cp1484", "GK"),
    Player("para_cp1485", "MF"),
    Player("para_cp1486", "MF"),
    Player("para_cp1487", "FW"),
    Player("para_cp1488", "FW"),
    Player("para_cp1489", "DF"),
    Player("para_cp1490", "MF"),
    Player("para_cp1491", "MF"),
    Player("para_cp1492", "DF"),
    Player("para_cp1493", "FW"),
    Player("para_cp1494", "MF"),
    Player("para_cp1495", "FW"),
    Player("para_cp1496", "GK"),
    Player("para_cp1497", "DF"),
    Player("para_cp1498", "FW"),
    Player("para_cp1499", "MF"),
    Player("para_cp1500", "FW"),
    Player("para_cp1501", "MF"),
    Player("para_cp1502", "FW"),
    Player("para_cp1503", "GK"),
    Player("para_cp1504", "DF"),
    Player("para_cp1505", "FW"),
    Player("para_cp1506", "FW"),
    Player("para_cp1507", "GK"),
    Player("para_cp1508", "DF"),
    Player("para_cp1509", "FW"),
    Player("para_cp1510", "FW"),
    Player("para_cp1511", "GK"),
    Player("para_cp1512", "DF"),
    Player("para_cp1513", "MF"),
    Player("para_cp1514", "FW"),
    Player("para_cp1515", "FW"),
    Player("para_cp1516", "DF"),
    Player("para_cp1517", "DF"),
    Player("para_cp1518", "GK"),
    Player("para_cp1519", "MF"),
    Player("para_cp1520", "FW"),
    Player("para_cp1521", "GK"),
    Player("para_cp1522", "DF"),
    Player("para_cp1523", "DF"),
    Player("para_cp1524", "DF"),
    Player("para_cp1525", "DF"),
    Player("para_cp1526", "MF"),
    Player("para_cp1527", "MF"),
    Player("para_cp1528", "MF"),
    Player("para_cp1529", "MF"),
    Player("para_cp1530", "FW"),
    Player("para_cp1531", "FW"),
    Player("para_cp1532", "GK"),
    Player("para_cp1533", "DF"),
    Player("para_cp1534", "DF"),
    Player("para_cp1535", "DF"),
    Player("para_cp1536", "DF"),
    Player("para_cp1537", "MF"),
    Player("para_cp1538", "MF"),
    Player("para_cp1539", "MF"),
    Player("para_cp1540", "MF"),
    Player("para_cp1541", "FW"),
    Player("para_cp1542", "FW"),
    Player("para_cp1601", "MF"),
    Player("para_cp1602", "FW"),
    Player("para_cp1603", "DF"),
    Player("para_cp1604", "GK"),
    Player("para_cp1605", "FW"),
    Player("para_cp1606", "FW"),
    Player("para_cp1607", "DF"),
    Player("para_cp1608", "MF"),
    Player("para_cp1609", "MF"),
    Player("para_cp1610", "DF"),
    Player("para_cp1611", "DF"),
    Player("para_cp1613", "GK"),
    Player("para_cp1614", "FW"),
    Player("para_cp1615", "GK"),
    Player("para_cp1616", "FW"),
    Player("para_cp1617", "DF"),
    Player("para_cp1618", "MF"),
    Player("para_cp1619", "MF"),
    Player("para_cp1620", "FW"),
    Player("para_cp1621", "DF"),
    Player("para_cp1701", "GK"),
    Player("para_cp1702", "DF"),
    Player("para_cp1703", "DF"),
    Player("para_cp1704", "DF"),
    Player("para_cp1705", "DF"),
    Player("para_cp1706", "MF"),
    Player("para_cp1707", "MF"),
    Player("para_cp1708", "MF"),
    Player("para_cp1709", "FW"),
    Player("para_cp1710", "FW"),
    Player("para_cp1711", "FW"),
    Player("para_cp1712", "FW"),
    Player("para_cp1713", "GK"),
    Player("para_cp1714", "FW"),
    Player("para_cp1715", "GK"),
    Player("para_cp1716", "DF"),
    Player("para_cp1717", "DF"),
    Player("para_cp1718", "DF"),
    Player("para_cp1719", "DF"),
    Player("para_cp1720", "MF"),
    Player("para_cp1721", "MF"),
    Player("para_cp1722", "MF"),
    Player("para_cp1723", "FW"),
    Player("para_cp1724", "MF"),
    Player("para_cp1725", "MF"),
    Player("para_cp1726", "MF"),
    Player("para_cp1727", "MF"),
    Player("para_cp1728", "DF"),
    Player("para_cp1729", "MF"),
    Player("para_cp1730", "FW"),
    Player("para_cp1731", "MF"),
    Player("para_cp1732", "GK"),
    Player("para_cp1733", "GK"),
    Player("para_cp1734", "DF"),
    Player("para_cp1735", "DF"),
    Player("para_cp1736", "DF"),
    Player("para_cp1737", "DF"),
    Player("para_cp1738", "MF"),
    Player("para_cp1739", "MF"),
    Player("para_cp1740", "MF"),
    Player("para_cp1741", "FW"),
    Player("para_cp1742", "MF"),
    Player("para_cp1743", "FW"),
    Player("para_cp1744", "GK"),
    Player("para_cp1745", "DF"),
    Player("para_cp1746", "MF"),
    Player("para_cp1747", "MF"),
    Player("para_cp1748", "MF"),
    Player("para_cp1749", "MF"),
    Player("para_cp1750", "FW"),
    Player("para_cp1751", "GK"),
    Player("para_cp1752", "DF"),
    Player("para_cp1753", "DF"),
    Player("para_cp1754", "DF"),
    Player("para_cp1755", "MF"),
    Player("para_cp1756", "MF"),
    Player("para_cp1757", "MF"),
    Player("para_cp1758", "MF"),
    Player("para_cp1759", "FW"),
    Player("para_cp1760", "DF"),
    Player("para_cp1761", "GK"),
    Player("para_cp1762", "DF"),
    Player("para_cp1763", "FW"),
    Player("para_cp1764", "DF"),
    Player("para_cp1765", "FW"),
    Player("para_cp1766", "FW"),
    Player("para_cp1767", "MF"),
    Player("para_cp1768", "FW"),
    Player("para_cp1769", "MF"),
    Player("para_cp1770", "GK"),
    Player("para_cp1771", "FW"),
    Player("para_cp1772", "DF"),
    Player("para_cp1773", "FW"),
    Player("para_cp1774", "FW"),
    Player("para_cp1775", "MF"),
    Player("para_cp1776", "MF"),
    Player("para_cp1777", "MF"),
    Player("para_cp1778", "DF"),
    Player("para_cp1779", "MF"),
    Player("para_cp1780", "DF"),
    Player("para_cp1781", "FW"),
    Player("para_cp1782", "MF"),
    Player("para_cp1783", "FW"),
    Player("para_cp1784", "FW"),
    Player("para_cp1785", "MF"),
    Player("para_cp1786", "DF"),
    Player("para_cp1787", "MF"),
    Player("para_cp1788", "FW"),
    Player("para_cp1789", "GK"),
    Player("para_cp1790", "MF"),
    Player("para_cp1791", "FW"),
    Player("para_cp1792", "FW"),
    Player("para_cp1793", "DF"),
    Player("para_cp1794", "GK"),
    Player("para_cp1795", "DF"),
    Player("para_cp1796", "MF"),
    Player("para_cp1797", "GK"),
    Player("para_cp1798", "GK"),
    Player("para_cp1799", "GK"),
    Player("para_cp1800", "DF"),
    Player("para_cp1801", "DF"),
    Player("para_cp1802", "MF"),
    Player("para_cp1803", "MF"),
    Player("para_cp1804", "FW"),
    Player("para_cp1805", "DF"),
    Player("para_cp1806", "FW"),
    Player("para_cp1807", "FW"),
    Player("para_cp1808", "MF"),
    Player("para_cp1809", "DF"),
    Player("para_cp1810", "GK"),
    Player("para_cp1811", "DF"),
    Player("para_cp1812", "DF"),
    Player("para_cp1813", "DF"),
    Player("para_cp1814", "MF"),
    Player("para_cp1815", "MF"),
    Player("para_cp1816", "FW"),
    Player("para_cp1817", "FW"),
    Player("para_cp1818", "GK"),
    Player("para_cp1819", "DF"),
    Player("para_cp1820", "DF"),
    Player("para_cp1821", "DF"),
    Player("para_cp1822", "MF"),
    Player("para_cp1823", "MF"),
    Player("para_cp1824", "FW"),
    Player("para_cp1825", "FW"),
    Player("para_cp1826", "FW"),
];

formations <- [
	"ifb0101",
	"ifb0102",
	"ifb0103",
	"ifb0104",
	"ifb0105",
	"ifb0106",
	"ifb0107",
	"ifb0108",
	"ifb0109",
	"ifb0110",
	"ifb0111",
];

uniforms <- [
	1,
	2,
	3,
	4,
	5,
	6,
	7,
	8,
	10,
	11,
	12,
	14,
	15,
	16,
	17,
	18,
	19,
	20,
	21,
	22,	
	23,		
	101,
	102,
	103,
	104,
	105,
	106,
	107,
	108,
	109,
	110,
	111,
	112,
	113,
	114,
	115,
	116,
	117,
	118,
	119,
	120,
	121,
	901,	
];

battleTeam <- [];
easy_flag <- 12;
hard_flag <- 13;
legend_flag <- 14;
win_flag <- 15;

function filterList(inputList, predicate) {
    local filteredList = [];
    
    foreach (item in inputList) {
        if (predicate(item)) {
            filteredList.append(item);
        }
    }
    
    return filteredList;
}

function isPlayerInTeam(player, team) {
    foreach (p in team) {
        if (p.name == player.name) {
            return true;
        }
    }
    return false;
}

function selectRandom(list) {
    return list[CMND_RANDOM(list.len())];
}

function getRandomKeyWithWeights(weights) {
    local totalWeight = 0;

    foreach (type, weight in weights) {
        totalWeight += weight;
    }

    local randValue = CMND_RANDOM(totalWeight);

    foreach (type, weight in weights) {
        if (randValue <= weight) {
            return type;
        } else {
            randValue -= weight;
        }
    }
}

function isHissatsusInMoveset(hissatsu, moveset) {
    foreach (h in moveset) {
        if (h.name == hissatsu.name) {
            return true;
        }
    }
    return false;
}

function sortList(list, compareFunction) {
    local len = list.len();

    for (local i = 0; i < len - 1; i++) {
        for (local j = 0; j < len - i - 1; j++) {
            if (compareFunction(list[j], list[j + 1]) > 0) {
                // Échanger les éléments s'ils sont dans le mauvais ordre
                local temp = list[j];
                list[j] = list[j + 1];
                list[j + 1] = temp;
            }
        }
    }
}

function indexOfList(list, item) {
    for (local i = 0; i < list.len(); i++) {
        if (list[i] == item) {
            return i;
        }
    }
	
    return -1; // Retourne -1 si l'élément n'est pas trouvé
}

function removeElementList(list, element) {
    local index = list.indexOfList(element);

    if (index != -1) {
        list.remove(index);
        return true;
    } else {
        return false;
    }
}

function customSort(hissatsuA, hissatsuB) {
    // Définir l'ordre de tri en fonction du type de hissatsu
    local order = ["shoot", "dribble", "defense", "save", "skill"];
    
    // Obtenir l'indice du type de hissatsu pour chaque hissatsu
    local indexA = indexOfList(order, hissatsuA.position);
    local indexB = indexOfList(order, hissatsuB.position);
    
    // Comparer les indices pour déterminer l'ordre de tri
    return indexA - indexB;
}

function generateHissatsuList(poste, difficulty) {
    local hissatsuList = [];
    globalDifficulty <- difficulty;

    local poids = {};
    poids["GK"] <- {save = 80, skill = 20};
    poids["DF"] <- {defense = 60, skill = 20, dribble = 10, shoot = 10};
    poids["MF"] <- {dribble = 60, skill = 20, defense = 10, shoot = 10};
    poids["FW"] <- {shoot = 60, skill = 20, dribble = 10, defense = 10};

    local conditions = {
        GK = {save = 1},
        DF = {defense = 1},
        MF = {dribble = 1},
        FW = {shoot = 1}
    };

    local minSkills = {
        easy = 1,
        hard = 1,
        legend = 2
    };

    local maxSkills = {
        easy = 1,
        hard = 2,
        legend = 5
    };

    local skillCount = 0;
    local totalHissatsus = 0;

    // Calcul du nombre total d'éléments en fonction de la difficulté
    switch (globalDifficulty) {
        case "easy":
            totalHissatsus = 4;
            break;
        case "hard":
            totalHissatsus = 5;
            break;
        case "legend":
            totalHissatsus = 6;
            break;
    }

    // Ajoute une hissatsu jusqu'à ce que la condition minimale soit satisfaite
    for (local i = 0; i < minSkills[difficulty]; i++) {
        local matchHissatsus = filterList(skills, function(h) {
                return h.difficulty == globalDifficulty;
       	});

        local randHissatsu = CMND_RANDOM(matchHissatsus.len());
        hissatsuList.append(matchHissatsus[randHissatsu]);
        skillCount += 1;
    }

    // Ajoute le reste des hissatsus
    while (hissatsuList.len() < totalHissatsus) {
	    local matchHissatsus = [];
		local getRandomPosition = getRandomKeyWithWeights(poids[poste]);
		
        if (getRandomPosition == "shoot") {
        	matchHissatsus = filterList(shoots, function(h) {
        		return h.difficulty == globalDifficulty;
        	});
        } else if (getRandomPosition == "defense") {
        	matchHissatsus = filterList(defenses, function(h) {
        		return h.difficulty == globalDifficulty;
        	});
        } else if (getRandomPosition == "dribble") {
        	matchHissatsus = filterList(dribbles, function(h) {
        		return h.difficulty == globalDifficulty;
        	});
        } else if (getRandomPosition == "save") {
        	matchHissatsus = filterList(saves, function(h) {
        		return h.difficulty == globalDifficulty;
        	});
        } else if (getRandomPosition == "skill") {
        	matchHissatsus = filterList(skills, function(h) {
        		return h.difficulty == globalDifficulty;
        	});
        }

		if (getRandomPosition == "skill") {
			if (skillCount < maxSkills[difficulty]) {
				local randHissatsu = CMND_RANDOM(matchHissatsus.len());
				hissatsuList.append(matchHissatsus[randHissatsu]);
			}
		} else {
			local randHissatsu = CMND_RANDOM(matchHissatsus.len());
			local newHissatsu = matchHissatsus[randHissatsu];
			if (!isHissatsusInMoveset(newHissatsu, hissatsuList)) {
				hissatsuList.append(newHissatsu);
			}
		}
    }

    return hissatsuList;
}

function generatePlayerWithHissatsus(player, difficulte) {
    player.hissatsus = generateHissatsuList(player.position, difficulte);
	sortList(player.hissatsus, customSort);
    return player;
}

function addPlayerToTeam(players, team, positionPredicat, difficulte) {
	local player = generatePlayerWithHissatsus(selectRandom(filterList(players, positionPredicat)), difficulte);
	
	while (isPlayerInTeam(player, team)) {
		player = generatePlayerWithHissatsus(selectRandom(filterList(players, positionPredicat)), difficulte);
	}
	
	team.append(player);
}

function CreateTeam(players, difficulte) {
    local team = [];
    
    // Ajoute le gardien de but
    addPlayerToTeam(players, team, function(p) { return p.position == "GK"; }, difficulte);
    
    // Ajoute le défenseur
    addPlayerToTeam(players, team, function(p) { return p.position == "DF"; }, difficulte);
    
    // Ajoute les joueurs de champ
    for (local i = 0; i < 2; i++) {
        addPlayerToTeam(players, team, function(p) { return p.position == "DF" || p.position == "MF" || p.position == "FW"; }, difficulte);
    }
    
    // Ajoute l'attaquant
    addPlayerToTeam(players, team, function(p) { return p.position == "FW"; }, difficulte);
    
    return team;
}

OPEN_CPU_BTL_FLAG <- function ( _flag )
{
	CMND_SET_GLOBAL_BIT_FLAG(_flag, 1);

	for( local i = 1650; i <= 1678; i++ )
	{

		if (!CMND_GET_GLOBAL_BIT_FLAG(i))
		{
			return;
		}
	}

	CMND_SET_GLOBAL_BIT_FLAG(1679, 1);
};

InitBtl <- function ()
{
	CMND_BTL_SET_FORMATIONID(1, formations[CMND_RANDOM(formations.len())]);
	
	CMND_BTL_SET_SHOES_AND_GLOVE(0, "ssa0001", "sga0001");

	if (CMND_GET_TEMP_BIT_FLAG(easy_flag))
	{
		battleTeam = CreateTeam(players, "easy");
		CMND_BTL_SET_SHOES_AND_GLOVE(1, "ssa0006", "sga0006");
	} else if (CMND_GET_TEMP_BIT_FLAG(hard_flag))
	{
		battleTeam = CreateTeam(players, "hard");
		CMND_BTL_SET_SHOES_AND_GLOVE(1, "ssa0010", "sga0010");
	} else if (CMND_GET_TEMP_BIT_FLAG(legend_flag))
	{
		battleTeam = CreateTeam(players, "legend");
		CMND_BTL_SET_SHOES_AND_GLOVE(1, "ssa0019", "sga0019");
	}
	
	for (local i = 0; i < 5; i++) {
		CMND_BTL_ADD_MEMBER(1, battleTeam[i].name, 99, i+1);
	}
};

BtlSetting <- function ()
{
	CMND_BTL_SET_TEAM_NAME(0, 1, "name_bfte_0001");
	CMND_BTL_SET_TEAM_NAME(1, 1, "name_bfte_0002");
	
	local uniform = CMND_RANDOM(uniforms.len());
	local uniform_outdoor = CMND_RANDOM(100);
	
	for (local i = 0; i < 5; i++) {
		foreach(hissatsu in defenses) {
			CMND_BTL_FORGET_SKILL(1, battleTeam[i].name, hissatsu.name, false);
		}
		
		foreach(hissatsu in dribbles) {
			CMND_BTL_FORGET_SKILL(1, battleTeam[i].name, hissatsu.name, false);
		}

		foreach(hissatsu in saves) {
			CMND_BTL_FORGET_SKILL(1, battleTeam[i].name, hissatsu.name, false);
		}	

		foreach(hissatsu in shoots) {
			CMND_BTL_FORGET_SKILL(1, battleTeam[i].name, hissatsu.name, false);
		}	

		foreach(hissatsu in skills) {
			CMND_BTL_FORGET_SKILL(1, battleTeam[i].name, hissatsu.name, false);
		}	

		foreach(hissatsu in battleTeam[i].hissatsus) {
			CMND_BTL_LEARNING_SKILL(1, battleTeam[i].name, hissatsu.name, 1);
		}
		
		if (uniform_outdoor < 50) {
			CMND_BTL_CHANGE_UNIFORM(1, battleTeam[i].name, uniform, 0, 0, uniform);
		} else {
			CMND_BTL_CHANGE_UNIFORM(1, battleTeam[i].name, uniform, 1, 0, uniform);
		}
	}
};

ScBtlResult <- function ()
{

};

CallMatchGoalEnd <- function ( teamInGoal, idSh, idKp )
{
};

CallMatchOwnGoalEnd <- function ( teamInGoal, idSh, idKp )
{
};

CallMatchGetPassBall <- function ( idGet, idPass )
{
};

CallMatchBeginMatch <- function ()
{

};

CallMatchKickoffFirst <- function ()
{

};

CallMatchEndMatch <- function ( teamWin, id0, id1 )
{
	if (teamWin == 0) {
		foreach(player in battleTeam) {
			if (!CMND_GET_PARTY_HANDLE(player.name)) {
				local newPlayer = CMND_ADD_PARTY(player.name);
				CMND_SET_LV(newPlayer, 99);
				
				for (local i = 0; i < player.hissatsus.len(); i++) {
					CMND_SET_SKILL(newPlayer, player.hissatsus[i].crc32, i);
				}
			}
		}	
	}
	
	CMND_SET_TEMP_BIT_FLAG(win_flag, teamWin == 0);
};