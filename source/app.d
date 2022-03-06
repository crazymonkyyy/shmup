import raylib;
import types;
import basic;
import gameplay;
import consants;

enum windowx=playfieldx;
enum windowy=playfieldy;

void main(){
	
	sounds deatheffects;
	

	
	
	
	mixin(import("drawing.mix"));
	InitAudioDevice(); 
	deatheffects~=LoadSound("assets/1.wav");
	deatheffects~=LoadSound("assets/2.wav");
	deatheffects~=LoadSound("assets/3.wav");
	SetSoundVolume(deatheffects[0], 0.2f);
	SetSoundVolume(deatheffects[1], 0.2f);
	SetSoundVolume(deatheffects[2], 0.2f);
	//TODO audio mixin
	background bg;
	auto backgroundbuffer=File("gen","r").byLineCopy;
	foreach(i;0..35){
		bg~=cast(tilerow)(backgroundbuffer.front.to!string.map!(a=>cast(ubyte)a).staticArray!25);
		backgroundbuffer.popFront;
	}
	player p;p.y=500;
	bullets b;
	enemyships es;
	enemybullets eb;
	unspawneds u=[unspawned(75, 1252, 1), unspawned(199, 1268, 1), unspawned(342, 1284, 1), unspawned(492, 1307, 1), unspawned(644, 1333, 1), unspawned(687, 1471, 1), unspawned(584, 1507, 1), unspawned(466, 1549, 1), unspawned(351, 1569, 1), unspawned(234, 1595, 1), unspawned(117, 1623, 1), unspawned(33, 1643, 1), unspawned(5, 1826, 11), unspawned(14, 1831, 11), unspawned(29, 1834, 11), unspawned(43, 1839, 11), unspawned(51, 1842, 11), unspawned(63, 1846, 11), unspawned(78, 1850, 11), unspawned(91, 1853, 11), unspawned(102, 1854, 11), unspawned(113, 1859, 11), unspawned(131, 1862, 11), unspawned(146, 1866, 11), unspawned(173, 1871, 11), unspawned(195, 1877, 11), unspawned(220, 1883, 11), unspawned(241, 1892, 11), unspawned(274, 1903, 11), unspawned(309, 1916, 11), unspawned(329, 1921, 11), unspawned(345, 1923, 11), unspawned(708, 2037, 11), unspawned(708, 2038, 11), unspawned(684, 2051, 11), unspawned(667, 2059, 11), unspawned(650, 2067, 11), unspawned(625, 2077, 11), unspawned(603, 2085, 11), unspawned(583, 2095, 11), unspawned(562, 2103, 11), unspawned(537, 2112, 11), unspawned(519, 2119, 11), unspawned(498, 2128, 11), unspawned(476, 2136, 11), unspawned(460, 2141, 11), unspawned(439, 2147, 11), unspawned(420, 2152, 11), unspawned(401, 2157, 11), unspawned(373, 2165, 11), unspawned(348, 2174, 11), unspawned(43, 2309, 11), unspawned(43, 2310, 11), unspawned(78, 2319, 11), unspawned(108, 2336, 11), unspawned(132, 2346, 11), unspawned(157, 2355, 11), unspawned(183, 2364, 11), unspawned(201, 2370, 11), unspawned(221, 2379, 11), unspawned(244, 2387, 11), unspawned(261, 2394, 11), unspawned(274, 2400, 11), unspawned(296, 2409, 11), unspawned(310, 2416, 11), unspawned(327, 2423, 11), unspawned(344, 2432, 11), unspawned(371, 2442, 11), unspawned(383, 2447, 11), unspawned(405, 2453, 11), unspawned(725, 2573, 11), unspawned(719, 2577, 11), unspawned(689, 2591, 11), unspawned(671, 2602, 11), unspawned(655, 2612, 11), unspawned(628, 2630, 11), unspawned(602, 2645, 11), unspawned(586, 2655, 11), unspawned(575, 2660, 11), unspawned(559, 2670, 11), unspawned(544, 2678, 11), unspawned(531, 2688, 11), unspawned(525, 2690, 11), unspawned(505, 2704, 11), unspawned(479, 2717, 11), unspawned(466, 2727, 11), unspawned(455, 2735, 11), unspawned(435, 2748, 11), unspawned(421, 2759, 11), unspawned(405, 2775, 11), unspawned(351, 2775, 1), unspawned(31, 2847, 11), unspawned(54, 2852, 11), unspawned(98, 2861, 11), unspawned(91, 2862, 11), unspawned(63, 2863, 11), unspawned(124, 2873, 11), unspawned(139, 2877, 11), unspawned(158, 2888, 11), unspawned(184, 2897, 11), unspawned(232, 2918, 11), unspawned(272, 2940, 11), unspawned(303, 2953, 11), unspawned(321, 2961, 11), unspawned(349, 2973, 11), unspawned(372, 2985, 11), unspawned(384, 2990, 11), unspawned(414, 3002, 11), unspawned(235, 3091, 22), unspawned(405, 3091, 11), unspawned(222, 3093, 22), unspawned(282, 3095, 22), unspawned(375, 3095, 22), unspawned(405, 3095, 22), unspawned(434, 3095, 22), unspawned(462, 3095, 22), unspawned(492, 3095, 22), unspawned(511, 3095, 22), unspawned(725, 3095, 11), unspawned(689, 3095, 11), unspawned(655, 3095, 11), unspawned(602, 3095, 11), unspawned(575, 3095, 11), unspawned(544, 3095, 11), unspawned(241, 3096, 22), unspawned(270, 3096, 22), unspawned(21, 3096, 22), unspawned(308, 3096, 22), unspawned(397, 3096, 22), unspawned(416, 3096, 22), unspawned(447, 3096, 22), unspawned(478, 3096, 22), unspawned(503, 3096, 22), unspawned(109, 3096, 22), unspawned(122, 3096, 22), unspawned(628, 3096, 11), unspawned(586, 3096, 11), unspawned(559, 3096, 11), unspawned(531, 3096, 11), unspawned(505, 3096, 11), unspawned(199, 3097, 22), unspawned(32, 3097, 22), unspawned(518, 3097, 22), unspawned(543, 3097, 22), unspawned(562, 3097, 22), unspawned(585, 3097, 22), unspawned(614, 3097, 22), unspawned(648, 3097, 22), unspawned(680, 3097, 22), unspawned(708, 3097, 22), unspawned(258, 3097, 22), unspawned(671, 3097, 11), unspawned(42, 3097, 22), unspawned(214, 3097, 22), unspawned(525, 3097, 11), unspawned(97, 3098, 22), unspawned(663, 3098, 22), unspawned(691, 3098, 22), unspawned(737, 3098, 22), unspawned(751, 3098, 22), unspawned(763, 3098, 22), unspawned(11, 3098, 22), unspawned(719, 3098, 11), unspawned(86, 3098, 22), unspawned(347, 3098, 22), unspawned(572, 3098, 22), unspawned(759, 3099, 22), unspawned(764, 3099, 22), unspawned(555, 3099, 22), unspawned(13, 3224, 22), unspawned(57, 3227, 22), unspawned(738, 3227, 22), unspawned(762, 3227, 22), unspawned(63, 3227, 11), unspawned(691, 3228, 22), unspawned(28, 3228, 22), unspawned(719, 3229, 22), unspawned(750, 3229, 22), unspawned(531, 3230, 22), unspawned(649, 3231, 22), unspawned(89, 3231, 22), unspawned(484, 3232, 22), unspawned(567, 3232, 22), unspawned(184, 3232, 22), unspawned(441, 3233, 22), unspawned(615, 3233, 22), unspawned(207, 3233, 22), unspawned(590, 3235, 22), unspawned(246, 3236, 22), unspawned(399, 3236, 22), unspawned(293, 3237, 22), unspawned(360, 3238, 22), unspawned(334, 3239, 22), unspawned(659, 3299, 11), unspawned(523, 3300, 11), unspawned(9, 3302, 11), unspawned(226, 3304, 11), unspawned(226, 3305, 11), unspawned(646, 3305, 11), unspawned(369, 3305, 11), unspawned(25, 3307, 11), unspawned(760, 3309, 11), unspawned(234, 3309, 11), unspawned(374, 3309, 11), unspawned(503, 3309, 11), unspawned(38, 3310, 11), unspawned(59, 3312, 11), unspawned(753, 3313, 11), unspawned(70, 3315, 11), unspawned(241, 3315, 11), unspawned(621, 3315, 11), unspawned(763, 3316, 22), unspawned(493, 3316, 11), unspawned(742, 3318, 11), unspawned(89, 3318, 11), unspawned(754, 3319, 22), unspawned(249, 3319, 11), unspawned(608, 3322, 11), unspawned(389, 3322, 11), unspawned(103, 3323, 11), unspawned(262, 3323, 11), unspawned(484, 3323, 11), unspawned(727, 3325, 11), unspawned(268, 3326, 11), unspawned(116, 3327, 11), unspawned(606, 3328, 1), unspawned(529, 3328, 1), unspawned(734, 3328, 22), unspawned(760, 3329, 22), unspawned(127, 3329, 11), unspawned(729, 3329, 1), unspawned(703, 3329, 22), unspawned(476, 3329, 11), unspawned(281, 3330, 11), unspawned(715, 3331, 11), unspawned(656, 3331, 22), unspawned(400, 3331, 11), unspawned(736, 3331, 22), unspawned(135, 3332, 11), unspawned(593, 3332, 11), unspawned(448, 3333, 1), unspawned(670, 3334, 1), unspawned(147, 3334, 11), unspawned(597, 3335, 22), unspawned(292, 3335, 11), unspawned(345, 3335, 1), unspawned(471, 3335, 11), unspawned(54, 3336, 1), unspawned(236, 3336, 1), unspawned(540, 3336, 22), unspawned(724, 3336, 22), unspawned(703, 3337, 11), unspawned(156, 3337, 11), unspawned(500, 3337, 22), unspawned(162, 3337, 11), unspawned(584, 3339, 11), unspawned(168, 3339, 11), unspawned(715, 3340, 22), unspawned(303, 3340, 11), unspawned(448, 3340, 22), unspawned(129, 3340, 1), unspawned(176, 3341, 11), unspawned(412, 3342, 11), unspawned(692, 3343, 11), unspawned(182, 3343, 11), unspawned(576, 3344, 11), unspawned(708, 3344, 22), unspawned(456, 3345, 11), unspawned(317, 3346, 11), unspawned(463, 3347, 11), unspawned(566, 3349, 11), unspawned(422, 3349, 11), unspawned(328, 3350, 11), unspawned(682, 3350, 11), unspawned(563, 3351, 11), unspawned(675, 3351, 11), unspawned(427, 3353, 11), unspawned(448, 3353, 22), unspawned(336, 3354, 11), unspawned(667, 3355, 11), unspawned(552, 3355, 11), unspawned(658, 3358, 11), unspawned(662, 3358, 11), unspawned(343, 3360, 11), unspawned(347, 3360, 11), unspawned(640, 3378, 1), unspawned(521, 3380, 1), unspawned(586, 3385, 1), unspawned(433, 3388, 1), unspawned(367, 3388, 1), unspawned(182, 3393, 1), unspawned(276, 3397, 1), unspawned(83, 3400, 1), unspawned(8, 3409, 22), unspawned(72, 3409, 22), unspawned(116, 3409, 22), unspawned(89, 3410, 22), unspawned(24, 3411, 22), unspawned(141, 3411, 22), unspawned(58, 3412, 22), unspawned(703, 3412, 22), unspawned(673, 3413, 22), unspawned(54, 3413, 1), unspawned(754, 3414, 22), unspawned(288, 3415, 22), unspawned(733, 3415, 22), unspawned(335, 3416, 22), unspawned(419, 3416, 22), unspawned(459, 3416, 22), unspawned(189, 3416, 22), unspawned(268, 3416, 22), unspawned(309, 3417, 22), unspawned(213, 3417, 22), unspawned(436, 3418, 22), unspawned(638, 3418, 22), unspawned(169, 3418, 22), unspawned(232, 3418, 22), unspawned(715, 3418, 11), unspawned(482, 3419, 22), unspawned(502, 3419, 22), unspawned(361, 3420, 22), unspawned(399, 3420, 22), unspawned(364, 3421, 22), unspawned(380, 3421, 22), unspawned(559, 3425, 22), unspawned(606, 3425, 22)];
	int scroll=0;
	int bgoffset=32;
	while (!WindowShouldClose()){
		BeginDrawing();
			ClearBackground(Colors.BLACK);
			drawbackground(bg,-bgoffset);bgoffset--;
			if(bgoffset==0){
				bg~=cast(tilerow)(backgroundbuffer.front.to!string.map!(a=>cast(ubyte)a).staticArray!25);
				backgroundbuffer.popFront;
				bgoffset=32;
			}
			drawbullets(b);
			drawenemybullets(eb);
			drawplayer(p);
			drawenemys(es);
			p.update(b,eb);
			b.update;
			es.update(eb,b,deatheffects);
			eb.update;
			u.update(scroll,es);scroll++;
			DrawText("Hello, World!", 10,10, 20, Colors.WHITE);
			//DrawFPS(10,10);
		EndDrawing();
	}
	CloseWindow();
}