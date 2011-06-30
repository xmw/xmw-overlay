# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit check-reqs games

DESCRIPTION="Airplanes for flightgear from the official mirror"
HOMEPAGE="http://www.flightgrear.org/"
SRC_URI="mirror://flightgear/Aircraft-2.0.0/14bis_20080922.zip
	mirror://flightgear/Aircraft-2.0.0/21_20090313.zip
	mirror://flightgear/Aircraft-2.0.0/707_20080509.zip
	mirror://flightgear/Aircraft-2.0.0/727-230_20100301.zip
	mirror://flightgear/Aircraft-2.0.0/737-100_20100216.zip
	mirror://flightgear/Aircraft-2.0.0/737-300_20100302.zip
	mirror://flightgear/Aircraft-2.0.0/747-200_1.1.zip
	mirror://flightgear/Aircraft-2.0.0/747-400_20100228.zip
	mirror://flightgear/Aircraft-2.0.0/747_20071215.zip
	mirror://flightgear/Aircraft-2.0.0/767-300_20100100.zip
	mirror://flightgear/Aircraft-2.0.0/787_200802.zip
	mirror://flightgear/Aircraft-2.0.0/A-10_20100227.zip
	mirror://flightgear/Aircraft-2.0.0/A-26-Invader_20090912.zip
	mirror://flightgear/Aircraft-2.0.0/A-6E_20091019.zip
	mirror://flightgear/Aircraft-2.0.0/A24-Viking_20090620.zip
	mirror://flightgear/Aircraft-2.0.0/A300_20061009.zip
	mirror://flightgear/Aircraft-2.0.0/A320-family_20070115.zip
	mirror://flightgear/Aircraft-2.0.0/A320_20070115.zip
	mirror://flightgear/Aircraft-2.0.0/A340-600_20080400.zip
	mirror://flightgear/Aircraft-2.0.0/A380_1.0.zip
	mirror://flightgear/Aircraft-2.0.0/AN-225_20071114.zip
	mirror://flightgear/Aircraft-2.0.0/ANT-20_20100216.zip
	mirror://flightgear/Aircraft-2.0.0/AR-234_20100213.zip
	mirror://flightgear/Aircraft-2.0.0/ASK21-MI_20090202.zip
	mirror://flightgear/Aircraft-2.0.0/ASK21_20070701.zip
	mirror://flightgear/Aircraft-2.0.0/ATC_20100302.zip
	mirror://flightgear/Aircraft-2.0.0/Aerostar-700_20090930.zip
	mirror://flightgear/Aircraft-2.0.0/AirCrane_20091207.zip
	mirror://flightgear/Aircraft-2.0.0/Albatross_20080304.zip
	mirror://flightgear/Aircraft-2.0.0/Allegro-2000_20100216.zip
	mirror://flightgear/Aircraft-2.0.0/Alouette-III_20080304.zip
	mirror://flightgear/Aircraft-2.0.0/Alouette-II_20090620.zip
	mirror://flightgear/Aircraft-2.0.0/Alphajet_20091229.zip
	mirror://flightgear/Aircraft-2.0.0/Arsenal-VG33_20091229.zip
	mirror://flightgear/Aircraft-2.0.0/Arup-S2_20090718.zip
	mirror://flightgear/Aircraft-2.0.0/Avro-Lancaster_20090907.zip
	mirror://flightgear/Aircraft-2.0.0/B-17_20091229.zip
	mirror://flightgear/Aircraft-2.0.0/B-1B_20100123.zip
	mirror://flightgear/Aircraft-2.0.0/B-24-Liberator_20090907.zip
	mirror://flightgear/Aircraft-2.0.0/B-25_20091112.zip
	mirror://flightgear/Aircraft-2.0.0/B-2_20080304.zip
	mirror://flightgear/Aircraft-2.0.0/B-52F_20071130.zip
	mirror://flightgear/Aircraft-2.0.0/B737_20050614.zip
	mirror://flightgear/Aircraft-2.0.0/BAC-TSR2_20080103.zip
	mirror://flightgear/Aircraft-2.0.0/BV-141_20090418.zip
	mirror://flightgear/Aircraft-2.0.0/Bernard-HV220_20090522.zip
	mirror://flightgear/Aircraft-2.0.0/Boeing314_1.3.zip
	mirror://flightgear/Aircraft-2.0.0/Bombardier-415_20090310.zip
	mirror://flightgear/Aircraft-2.0.0/Buccaneer_0.1.zip
	mirror://flightgear/Aircraft-2.0.0/Bugatti_20090419.zip
	mirror://flightgear/Aircraft-2.0.0/C-2A_20081220.zip
	mirror://flightgear/Aircraft-2.0.0/C130_20100302.zip
	mirror://flightgear/Aircraft-2.0.0/C684_20100124.zip
	mirror://flightgear/Aircraft-2.0.0/CanberraBI8_20071106.zip
	mirror://flightgear/Aircraft-2.0.0/Caravelle_20091229.zip
	mirror://flightgear/Aircraft-2.0.0/Carreidas_20100227.zip
	mirror://flightgear/Aircraft-2.0.0/Citation-Bravo_20100216.zip
	mirror://flightgear/Aircraft-2.0.0/Citation_20100201.zip
	mirror://flightgear/Aircraft-2.0.0/ComperSwift_20071106.zip
	mirror://flightgear/Aircraft-2.0.0/Concorde_2.6.zip
	mirror://flightgear/Aircraft-2.0.0/Convair-XFY-1-Pogo_20090301.zip
	mirror://flightgear/Aircraft-2.0.0/DH-88_20090302.zip
	mirror://flightgear/Aircraft-2.0.0/DH-89_20090303.zip
	mirror://flightgear/Aircraft-2.0.0/DH-91_20080805.zip
	mirror://flightgear/Aircraft-2.0.0/DO-335_20090303.zip
	mirror://flightgear/Aircraft-2.0.0/DO-X_20090702.zip
	mirror://flightgear/Aircraft-2.0.0/DR400_20100216.zip
	mirror://flightgear/Aircraft-2.0.0/Dauphin_20090620.zip
	mirror://flightgear/Aircraft-2.0.0/Deperdussin_20090126.zip
	mirror://flightgear/Aircraft-2.0.0/DerKleineUhu_0.1.zip
	mirror://flightgear/Aircraft-2.0.0/Deuche_20081220.zip
	mirror://flightgear/Aircraft-2.0.0/E3B_20090301.zip
	mirror://flightgear/Aircraft-2.0.0/F-106-dart_20090110.zip
	mirror://flightgear/Aircraft-2.0.0/F-117_20100302.zip
	mirror://flightgear/Aircraft-2.0.0/F-86_20090529.zip
	mirror://flightgear/Aircraft-2.0.0/F-8E-Crusader_20090405.zip
	mirror://flightgear/Aircraft-2.0.0/F4U_20100216.zip
	mirror://flightgear/Aircraft-2.0.0/F6F-Hellcat_20100110.zip
	mirror://flightgear/Aircraft-2.0.0/F80C_20070521.zip
	mirror://flightgear/Aircraft-2.0.0/FK9MK2_20090522.zip
	mirror://flightgear/Aircraft-2.0.0/Farman-IV_20090522.zip
	mirror://flightgear/Aircraft-2.0.0/Fokker-S-11_20091216.zip
	mirror://flightgear/Aircraft-2.0.0/Fouga-Magister_20100216.zip
	mirror://flightgear/Aircraft-2.0.0/Fw61_20091025.zip
	mirror://flightgear/Aircraft-2.0.0/Gee-Bee_20090715.zip
	mirror://flightgear/Aircraft-2.0.0/Grob-G109_20080828.zip
	mirror://flightgear/Aircraft-2.0.0/Grob-G115_20090715.zip
	mirror://flightgear/Aircraft-2.0.0/H-21C-Shawnee_20080304.zip
	mirror://flightgear/Aircraft-2.0.0/H1-Racer_20100201.zip
	mirror://flightgear/Aircraft-2.0.0/H4-Hercules_20091229.zip
	mirror://flightgear/Aircraft-2.0.0/HM-14_20100101.zip
	mirror://flightgear/Aircraft-2.0.0/HUP-Retriever_20080304.zip
	mirror://flightgear/Aircraft-2.0.0/Hansajet_0.1.zip
	mirror://flightgear/Aircraft-2.0.0/He162_20080223.zip
	mirror://flightgear/Aircraft-2.0.0/HondaJet_20091229.zip
	mirror://flightgear/Aircraft-2.0.0/Hornet_20090406.zip
	mirror://flightgear/Aircraft-2.0.0/Horten-Ho-IX_20091229.zip
	mirror://flightgear/Aircraft-2.0.0/Hughes-XF11_20080808.zip
	mirror://flightgear/Aircraft-2.0.0/Hunter_20090202.zip
	mirror://flightgear/Aircraft-2.0.0/Hurricane_20100227.zip
	mirror://flightgear/Aircraft-2.0.0/IL-2_20090604.zip
	mirror://flightgear/Aircraft-2.0.0/Jaguar_20090529.zip
	mirror://flightgear/Aircraft-2.0.0/Ju-87_20100227.zip
	mirror://flightgear/Aircraft-2.0.0/Junkers-G.38ce_20090704.zip
	mirror://flightgear/Aircraft-2.0.0/K5Y1_0.1.zip
	mirror://flightgear/Aircraft-2.0.0/KC135_20090327.zip
	mirror://flightgear/Aircraft-2.0.0/Ka-50_20090620.zip
	mirror://flightgear/Aircraft-2.0.0/Katana_20091010.zip
	mirror://flightgear/Aircraft-2.0.0/Ki-84_20081219.zip
	mirror://flightgear/Aircraft-2.0.0/L-1011-500_20090418.zip
	mirror://flightgear/Aircraft-2.0.0/La-5_20090603.zip
	mirror://flightgear/Aircraft-2.0.0/Lancair-235_20090307.zip
	mirror://flightgear/Aircraft-2.0.0/Lightning_20081023.zip
	mirror://flightgear/Aircraft-2.0.0/Lionceau_20091229.zip
	mirror://flightgear/Aircraft-2.0.0/Lockheed-NF104A_20100216.zip
	mirror://flightgear/Aircraft-2.0.0/Lockheed-SR71_20081023.zip
	mirror://flightgear/Aircraft-2.0.0/Lockheed-Vega_20100216.zip
	mirror://flightgear/Aircraft-2.0.0/Lockheed1049_1.3.zip
	mirror://flightgear/Aircraft-2.0.0/Long-EZ_20091022.zip
	mirror://flightgear/Aircraft-2.0.0/Lynx-WG13_20080304.zip
	mirror://flightgear/Aircraft-2.0.0/MB326_20090709.zip
	mirror://flightgear/Aircraft-2.0.0/MD11_20070618.zip
	mirror://flightgear/Aircraft-2.0.0/ME-262HGIII_20091229.zip
	mirror://flightgear/Aircraft-2.0.0/ME-262_20091130.zip
	mirror://flightgear/Aircraft-2.0.0/MPCarrier_0.1.zip
	mirror://flightgear/Aircraft-2.0.0/MRJ_20090820.zip
	mirror://flightgear/Aircraft-2.0.0/Macchi-Castoldi-MC72_20090522.zip
	mirror://flightgear/Aircraft-2.0.0/Malolo1_0.0.zip
	mirror://flightgear/Aircraft-2.0.0/MiG-15_20071106.zip
	mirror://flightgear/Aircraft-2.0.0/Mig-29_20100302.zip
	mirror://flightgear/Aircraft-2.0.0/Noratlas_20081219.zip
	mirror://flightgear/Aircraft-2.0.0/Northrop-xb35_20100123.zip
	mirror://flightgear/Aircraft-2.0.0/OH-1_0.1.zip
	mirror://flightgear/Aircraft-2.0.0/OV10_20100123.zip
	mirror://flightgear/Aircraft-2.0.0/P-38-Lightning_20090115.zip
	mirror://flightgear/Aircraft-2.0.0/P180_20080212.zip
	mirror://flightgear/Aircraft-2.0.0/P47_20090316.zip
	mirror://flightgear/Aircraft-2.0.0/PBY-Catalina_20090411.zip
	mirror://flightgear/Aircraft-2.0.0/PC-6_20090930.zip
	mirror://flightgear/Aircraft-2.0.0/Polikarpov-I16_20090529.zip
	mirror://flightgear/Aircraft-2.0.0/Pond-Racer_20091229.zip
	mirror://flightgear/Aircraft-2.0.0/Quickie_20091229.zip
	mirror://flightgear/Aircraft-2.0.0/R22_20080503.zip
	mirror://flightgear/Aircraft-2.0.0/RV-6A_0.1.zip
	mirror://flightgear/Aircraft-2.0.0/RafaleB_20100205.zip
	mirror://flightgear/Aircraft-2.0.0/Rascal_0.1.zip
	mirror://flightgear/Aircraft-2.0.0/Ryan-PT22_20091229.zip
	mirror://flightgear/Aircraft-2.0.0/Ryan-SoSL_20090622.zip
	mirror://flightgear/Aircraft-2.0.0/S-51-Dragonfly_20081116.zip
	mirror://flightgear/Aircraft-2.0.0/SM-55_20091229.zip
	mirror://flightgear/Aircraft-2.0.0/SPAD-VII_20090725.zip
	mirror://flightgear/Aircraft-2.0.0/SR71-BlackBird_20090930.zip
	mirror://flightgear/Aircraft-2.0.0/SU-37_20080202.zip
	mirror://flightgear/Aircraft-2.0.0/SaabJ35Draken_20080304.zip
	mirror://flightgear/Aircraft-2.0.0/SeaVixen_20080304.zip
	mirror://flightgear/Aircraft-2.0.0/Sikorsky-76C_20090406.zip
	mirror://flightgear/Aircraft-2.0.0/Sikorsky-S38_20090802.zip
	mirror://flightgear/Aircraft-2.0.0/Sikorsky-S58_20090331.zip
	mirror://flightgear/Aircraft-2.0.0/Skyranger_20090522.zip
	mirror://flightgear/Aircraft-2.0.0/Skyvan_20090416.zip
	mirror://flightgear/Aircraft-2.0.0/Spitfire_20100227.zip
	mirror://flightgear/Aircraft-2.0.0/Stampe-SV4_20091229.zip
	mirror://flightgear/Aircraft-2.0.0/Starship_20090620.zip
	mirror://flightgear/Aircraft-2.0.0/Stearman_20090921.zip
	mirror://flightgear/Aircraft-2.0.0/Stieglitz_20091028.zip
	mirror://flightgear/Aircraft-2.0.0/Stiletto_20091229.zip
	mirror://flightgear/Aircraft-2.0.0/Storch_1.0.zip
	mirror://flightgear/Aircraft-2.0.0/Su-26M_1.0.zip
	mirror://flightgear/Aircraft-2.0.0/Submarine_Scout_1.0.zip
	mirror://flightgear/Aircraft-2.0.0/Super-Frelon_20090620.zip
	mirror://flightgear/Aircraft-2.0.0/Supermarine-S.6B_20090427.zip
	mirror://flightgear/Aircraft-2.0.0/Superwal_20091028.zip
	mirror://flightgear/Aircraft-2.0.0/T-4_20080719.zip
	mirror://flightgear/Aircraft-2.0.0/T37_20081023.zip
	mirror://flightgear/Aircraft-2.0.0/T38_20081023.zip
	mirror://flightgear/Aircraft-2.0.0/TBM-Avenger_20081116.zip
	mirror://flightgear/Aircraft-2.0.0/TU-114_20080103.zip
	mirror://flightgear/Aircraft-2.0.0/Tigre_20090702.zip
	mirror://flightgear/Aircraft-2.0.0/UH-1_20091207.zip
	mirror://flightgear/Aircraft-2.0.0/UH-60_20090331.zip
	mirror://flightgear/Aircraft-2.0.0/V22-Osprey_0.2.zip
	mirror://flightgear/Aircraft-2.0.0/Velocity-XL_20090603.zip
	mirror://flightgear/Aircraft-2.0.0/Vickers-Vimy_20080922.zip
	mirror://flightgear/Aircraft-2.0.0/X15_20061204.zip
	mirror://flightgear/Aircraft-2.0.0/YF-23_20081030.zip
	mirror://flightgear/Aircraft-2.0.0/YS-11_0.1.zip
	mirror://flightgear/Aircraft-2.0.0/YardStik_0.0.zip
	mirror://flightgear/Aircraft-2.0.0/ZF_Navy_free_balloon_1.0.zip
	mirror://flightgear/Aircraft-2.0.0/ZivkoEdge_0.1.zip
	mirror://flightgear/Aircraft-2.0.0/Zlin-50lx_20091229.zip
	mirror://flightgear/Aircraft-2.0.0/a4_20080828.zip
	mirror://flightgear/Aircraft-2.0.0/airwaveXtreme150_20050430.zip
	mirror://flightgear/Aircraft-2.0.0/an2_20080828.zip
	mirror://flightgear/Aircraft-2.0.0/apache_20080617.zip
	mirror://flightgear/Aircraft-2.0.0/as332_20091229.zip
	mirror://flightgear/Aircraft-2.0.0/asw20_20050430.zip
	mirror://flightgear/Aircraft-2.0.0/b26_20100130.zip
	mirror://flightgear/Aircraft-2.0.0/b29_20081030.zip
	mirror://flightgear/Aircraft-2.0.0/beaufighter_20100216.zip
	mirror://flightgear/Aircraft-2.0.0/beech99_20080304.zip
	mirror://flightgear/Aircraft-2.0.0/bf109_20100201.zip
	mirror://flightgear/Aircraft-2.0.0/bleriot-XI_20090323.zip
	mirror://flightgear/Aircraft-2.0.0/bluebird_10.4.zip
	mirror://flightgear/Aircraft-2.0.0/bocian_20080722.zip
	mirror://flightgear/Aircraft-2.0.0/c150_20091117.zip
	mirror://flightgear/Aircraft-2.0.0/c172r_20060313.zip
	mirror://flightgear/Aircraft-2.0.0/c182_20080808.zip
	mirror://flightgear/Aircraft-2.0.0/c182rg_20080707.zip
	mirror://flightgear/Aircraft-2.0.0/c310_20090129.zip
	mirror://flightgear/Aircraft-2.0.0/c310u3a_20070206.zip
	mirror://flightgear/Aircraft-2.0.0/ch47_0.1.zip
	mirror://flightgear/Aircraft-2.0.0/ch53e_0.1.zip
	mirror://flightgear/Aircraft-2.0.0/colditz_20070515.zip
	mirror://flightgear/Aircraft-2.0.0/couzinet70_20100123.zip
	mirror://flightgear/Aircraft-2.0.0/cri-cri_20080304.zip
	mirror://flightgear/Aircraft-2.0.0/dc2_20100302.zip
	mirror://flightgear/Aircraft-2.0.0/dc3_20091117.zip
	mirror://flightgear/Aircraft-2.0.0/dc6_20091112.zip
	mirror://flightgear/Aircraft-2.0.0/dhc3_20091229.zip
	mirror://flightgear/Aircraft-2.0.0/dhc6_20090901.zip
	mirror://flightgear/Aircraft-2.0.0/dhc8_20090218.zip
	mirror://flightgear/Aircraft-2.0.0/ec130_0.1.zip
	mirror://flightgear/Aircraft-2.0.0/ec135_0.6.zip
	mirror://flightgear/Aircraft-2.0.0/ercoupe_20081117.zip
	mirror://flightgear/Aircraft-2.0.0/eurofighter_20100302.zip
	mirror://flightgear/Aircraft-2.0.0/f15c_20081106.zip
	mirror://flightgear/Aircraft-2.0.0/f16_20100123.zip
	mirror://flightgear/Aircraft-2.0.0/f18_20070317.zip
	mirror://flightgear/Aircraft-2.0.0/fkdr1_20090820.zip
	mirror://flightgear/Aircraft-2.0.0/flash2a_20080304.zip
	mirror://flightgear/Aircraft-2.0.0/fokker100_20091117.zip
	mirror://flightgear/Aircraft-2.0.0/fokker50_20090529.zip
	mirror://flightgear/Aircraft-2.0.0/fw190_20100227.zip
	mirror://flightgear/Aircraft-2.0.0/harrier_20100123.zip
	mirror://flightgear/Aircraft-2.0.0/j22_20050614.zip
	mirror://flightgear/Aircraft-2.0.0/j7w_20081219.zip
	mirror://flightgear/Aircraft-2.0.0/jeep_20100201.zip
	mirror://flightgear/Aircraft-2.0.0/ju52_20100216.zip
	mirror://flightgear/Aircraft-2.0.0/l39_20100219.zip
	mirror://flightgear/Aircraft-2.0.0/marchetti_20050614.zip
	mirror://flightgear/Aircraft-2.0.0/mirage2000_20070103.zip
	mirror://flightgear/Aircraft-2.0.0/mosquito_20090808.zip
	mirror://flightgear/Aircraft-2.0.0/ogel_20090323.zip
	mirror://flightgear/Aircraft-2.0.0/ornithopter_20050430.zip
	mirror://flightgear/Aircraft-2.0.0/p51d_20100227.zip
	mirror://flightgear/Aircraft-2.0.0/pa22_20090702.zip
	mirror://flightgear/Aircraft-2.0.0/pa24-250_20100123.zip
	mirror://flightgear/Aircraft-2.0.0/pa28-161_20091229.zip
	mirror://flightgear/Aircraft-2.0.0/paraglider_20060114.zip
	mirror://flightgear/Aircraft-2.0.0/payen-pa100_20090405.zip
	mirror://flightgear/Aircraft-2.0.0/pc7_20090418.zip
	mirror://flightgear/Aircraft-2.0.0/pittss1c_20100216.zip
	mirror://flightgear/Aircraft-2.0.0/pushback_20080405.zip
	mirror://flightgear/Aircraft-2.0.0/rallye-MS893_20090404.zip
	mirror://flightgear/Aircraft-2.0.0/santa_20051026.zip
	mirror://flightgear/Aircraft-2.0.0/seahawk_20100204.zip
	mirror://flightgear/Aircraft-2.0.0/sgs233_20070506.zip
	mirror://flightgear/Aircraft-2.0.0/shuttle_20080808.zip
	mirror://flightgear/Aircraft-2.0.0/snowplow_1.0.zip
	mirror://flightgear/Aircraft-2.0.0/spitfireIX_20100216.zip
	mirror://flightgear/Aircraft-2.0.0/sr20_20051010.zip
	mirror://flightgear/Aircraft-2.0.0/truck_20071027.zip
	mirror://flightgear/Aircraft-2.0.0/tu154_20060501.zip
	mirror://flightgear/Aircraft-2.0.0/victor_20100302.zip
	mirror://flightgear/Aircraft-2.0.0/vulcanb2_20091103.zip
	mirror://flightgear/Aircraft-2.0.0/wrightFlyer1903_20050430.zip
	mirror://flightgear/Aircraft-2.0.0/x24b_20060114.zip"

# these ones were already in the data file of games-simulation/flightgear-2.0.0
#	mirror://flightgear/Aircraft-2.0.0/777-200_20100008.zip
#	mirror://flightgear/Aircraft-2.0.0/A6M2_20090320.zip
#	mirror://flightgear/Aircraft-2.0.0/CitationX_20090910.zip
#	mirror://flightgear/Aircraft-2.0.0/Dragonfly_1.0.zip
#	mirror://flightgear/Aircraft-2.0.0/SenecaII_0.5.zip
#	mirror://flightgear/Aircraft-2.0.0/ZLT-NT_1.0.zip
#	mirror://flightgear/Aircraft-2.0.0/b1900d_20100201.zip
#	mirror://flightgear/Aircraft-2.0.0/bo105_20100216.zip
#	mirror://flightgear/Aircraft-2.0.0/c172p_20091229.zip
#	mirror://flightgear/Aircraft-2.0.0/dhc2_20090901.zip
#	mirror://flightgear/Aircraft-2.0.0/f-14b_1.0.zip
#	mirror://flightgear/Aircraft-2.0.0/j3cub_20091102.zip
#	mirror://flightgear/Aircraft-2.0.0/sopwithCamel_20081229.zip
#	mirror://flightgear/Aircraft-2.0.0/ufo_20090320.zip

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="games-simulation/flightgear"
DEPEND="app-arch/unzip"

S=${WORKDIR}

pkg_setup() {
	games_pkg_setup

	CHECKREQS_DISK_BUILD=2445
	CHECKREQS_DISK_USR=2445
	check_reqs
}

src_prepare() {
	#remove file with strange filename
	rm f16/Models/Liveries/fach/L*.txt || die
}

src_install() {
	dodir "${GAMES_DATADIR}"/FlightGear/Aircraft || die
	mv * "${D}${GAMES_DATADIR}"/FlightGear/Aircraft || die

	prepgamesdirs
}
