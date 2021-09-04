extends Control

onready var node_sheng_ming = $"GridContainer/lable2"
onready var node_nei_li = $"GridContainer/lable4"
onready var node_li_dao = $"GridContainer/lable6"
onready var node_hu_ti = $"GridContainer/lable8"
onready var node_shen_fa = $"GridContainer/lable10"
onready var node_yi_shu = $"GridContainer/lable12"
onready var node_yong_du = $"GridContainer/lable14"
onready var node_jie_du = $"GridContainer/lable16"
onready var node_quan_zhang = $"GridContainer/lable18"
onready var node_yu_jian = $"GridContainer/lable20"
onready var node_an_qi = $"GridContainer/lable22"
onready var node_wu_xing = $"GridContainer/lable24"

onready var node_xing = $"lable0/xing"
onready var node_ming = $"lable0/ming"

onready var npc = $"npc"

var bai_jia_xing = [
	"赵","钱","孙","李","周","吴","郑","王","冯","陈","褚","卫","蒋","沈","韩","杨","朱","秦","尤","许","何","吕","施","张","孔","曹","严","华","金","魏","陶","姜","戚","谢","邹","喻","柏","水","窦","章","云","苏","潘","葛","奚","范","彭","郎","鲁","韦","昌","马","苗","凤","花","方","俞","任","袁","柳","酆","鲍","史","唐","费","廉","岑","薛","雷","贺","倪","汤","滕","殷","罗","毕","郝","邬","安","常","乐","于","时","傅","皮","卞","齐","康","伍","余","元","卜","顾","孟","平","黄","和","穆","萧","尹","姚","邵","湛","汪","祁","毛","禹","狄","米","贝","明","臧","计","伏","成","戴","谈","宋","茅","庞","熊","纪","舒","屈","项","祝","董","梁","杜","阮","蓝","闵","席","季","麻","强","贾","路","娄","危","江","童","颜","郭","梅","盛","林","刁","钟","徐","邱","骆","高","夏","蔡","田","樊","胡","凌","霍","虞","万","支","柯","昝","管","卢","莫","经","房","裘","缪","干","解","应","宗","丁","宣","贲","邓","郁","单","杭","洪","包","诸","左","石","崔","吉","钮","龚","程","嵇","邢","滑","裴","陆","荣","翁","荀","羊","於","惠","甄","曲","家","封","芮","羿","储","靳","汲","邴","糜","松","井","段","富","巫","乌","焦","巴","弓","牧","隗","山","谷","车","侯","宓","蓬","全","郗","班","仰","秋","仲","伊","宫","宁","仇","栾","暴","甘","钭","厉","戎","祖","武","符","刘","景","詹","束","龙","叶","幸","司","韶","郜","黎","蓟","薄","印","宿","白","怀","蒲","邰","从","鄂","索","咸","籍","赖","卓","蔺","屠","蒙","池","乔","阴","鬱","胥","能","苍","双","闻","莘","党","翟","谭","贡","劳","逄","姬","申","扶","堵","冉","宰","郦","雍","郤","璩","桑","桂","濮","牛","寿","通","边","扈","燕","冀","郏","浦","尚","农","温","别","庄","晏","柴","瞿","阎","充","慕","连","茹","习","宦","艾","鱼","容","向","古","易","慎","戈","廖","庾","终","暨","居","衡","步","都","耿","满","弘","匡","国","文","寇","广","禄","阙","东","欧","殳","沃","利","蔚","越","夔","隆","师","巩","厍","聂","晁","勾","敖","融","冷","訾","辛","阚","那","简","饶","空","曾","毋","沙","乜","养","鞠","须","丰","巢","关","蒯","相","查","后","荆","红","游","竺","权","逯","盖","益","桓","公","万","俟","司","马","上","官","欧","阳","夏","侯","诸","葛","闻","人","东","方","赫","连","皇","甫","尉","迟","公","羊","澹","台","公","冶","宗","政","濮","阳","淳","于","单","于","太","叔","申","屠","公","孙","仲","孙","轩","辕","令","狐","钟","离","宇","文","长","孙","慕","容","鲜","于","闾","丘","司","徒","司","空","丌","官","司","寇","仉","督","子","车","颛","孙","端","木","巫","马","公","西","漆","雕","乐","正","壤","驷","公","良","拓","跋","夹","谷","宰","父","谷","梁","晋","楚","闫","法","汝","鄢","涂","钦","段","干","百","里","东","郭","南","门","呼","延","归","海","羊","舌","微","生","岳","帅","缑","亢","况","郈","有","琴","梁","丘","左","丘","东","门","西","门","商","牟","佘","佴","伯","赏","南","宫","墨","哈","谯","笪","年","爱","阳","佟"
]

var ming_zi = [
	"伯庸","正则","灵均","望舒","云旗","浩倡","扬灵","既明","翾飞","承宇","怀信","怀瑾","嘉树","耀灵","琬琰","冬荣","博衍","高翔","怀德","显荣","逾明","凌恒","景云","依斐","自清","昂驹","邦彦","耀灵","嘉志","鸿永"
]

var player_data = {
	"xingshi":"",
	"mingzi":"",
	"shengming":0,
	"neili":0,
	"lidao":0,
	"huti":0,
	"shenfa":0,
	"yishu":0,
	"yongdu":0,
	"jiedu":0,
	"quanzhang":0,
	"yujian":0,
	"anqi":0,
	"wuxing":0,
	"fuyuan":0
}

func _ready():
	npc.set_sprite("res://asset/image/player/Image 144.jpg")
	set_random_attribute()
	set_rand_name()
	
func set_random_attribute():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var shengming = rng.randi_range(30, 50)
	var neili = rng.randi_range(10, 50)
	var lidao = rng.randi_range(5, 30)
	var huti = rng.randi_range(5, 30)
	var shenfa = rng.randi_range(5, 30)
	var yishu = rng.randi_range(5, 30)
	var yongdu = rng.randi_range(5, 30)
	var jiedu = rng.randi_range(5, 30)
	var quanzhang = rng.randi_range(5, 30)
	var yujian = rng.randi_range(5, 30)
	var anqi = rng.randi_range(5, 30)
	var wuxing = rng.randi_range(5, 100)
	var fuyuan = rng.randi_range(5, 100)
	player_data.shengming = shengming
	player_data.neili = neili
	player_data.lidao = lidao
	player_data.huti = huti
	player_data.shenfa = shenfa
	player_data.yishu = yishu
	player_data.yongdu = yongdu
	player_data.jiedu = jiedu
	player_data.quanzhang = quanzhang
	player_data.yujian = yujian
	player_data.anqi = anqi
	player_data.wuxing = wuxing
	player_data.fuyuan = fuyuan
	node_sheng_ming.text = str(shengming)
	node_nei_li.text = str(neili)
	node_li_dao.text = str(lidao)
	node_hu_ti.text = str(huti)
	node_shen_fa.text = str(shenfa)
	node_yi_shu.text = str(yishu)
	node_yong_du.text = str(yongdu)
	node_jie_du.text = str(jiedu)
	node_quan_zhang.text = str(quanzhang)
	node_yu_jian.text = str(yujian)
	node_an_qi.text = str(anqi)
	node_wu_xing.text = str(wuxing)
	
func set_rand_name():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var xingshi = bai_jia_xing[rng.randi_range(0, bai_jia_xing.size()-1)]
	var mingzi = ming_zi[rng.randi_range(0, ming_zi.size()-1)]
	node_xing.text = xingshi
	node_ming.text = mingzi

func _on_xing_ming_rand_pressed():
	set_rand_name()


func _on_shu_xing_rand_pressed():
	set_random_attribute()


func _on_OK_pressed():
	player_data.xingshi = node_xing.text
	player_data.mingzi = node_ming.text
	GameStatus.player_data = player_data
	SceneChanger.goto("res://src/level/level0.tscn")
