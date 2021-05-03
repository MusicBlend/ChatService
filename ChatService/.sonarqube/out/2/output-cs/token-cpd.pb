ã
vC:\Users\Dylan Picus\Documents\Vault\ICT\S3-DB01\MusicBlend\ChatService\ChatService\Controllers\CommunityController.cs
	namespace		 	
ChatService		
 
.		 
Controllers		 !
{

 
public 

class 
CommunityController $
:% &
ControllerBase' 5
{ 
private 
readonly  
ICommunityRepository - 
_communityRepository. B
;B C
public 
CommunityController "
(" # 
ICommunityRepository# 7
communityRepository8 K
)K L
{ 	 
_communityRepository  
=! "
communityRepository# 6
;6 7
} 	
private 
async 
Task 
SaveCommunity (
(( )
string) /
communityName0 =
,= >
string? E
userIdF L
,L M
stringN T
connectionIdU a
,a b
stringc i
usernamej r
)r s
{ 	

Connection 
newConnection $
=% &
new' *

Connection+ 5
(5 6
)6 7
{ 
ConnectionId 
= 
connectionId +
} 
; 
User 
	firstUser 
= 
new  
User! %
(% &
)& '
{ 
Id 
= 
userId 
, 
}   
;   
	Community"" 
newCommunity"" "
=""# $
new""% (
	Community"") 2
(""2 3
)""3 4
{## 
Id$$ 
=$$ 
Guid$$ 
.$$ 
NewGuid$$ !
($$! "
)$$" #
,$$# $
CommunityName%% 
=%% 
communityName%%  -
,%%- .
RoomCode&& 
=&& 
GenerateRoomCode&& +
(&&+ ,
)&&, -
,&&- .
}'' 
;'' 
	firstUser(( 
.(( 
Connections(( !
.((! "
Add((" %
(((% &
newConnection((& 3
)((3 4
;((4 5
newCommunity)) 
.)) 
Users)) 
.)) 
Add)) "
())" #
	firstUser))# ,
))), -
;))- .
await**  
_communityRepository** &
.**& '
CreateCommunity**' 6
(**6 7
newCommunity**7 C
)**C D
;**D E
}++ 	
private,, 
string,, 
GenerateRoomCode,, '
(,,' (
),,( )
{-- 	
UniqueId.. 
uniqueId.. 
=.. 
new..  #
UniqueId..$ ,
(.., -
)..- .
;... /
return// 
uniqueId// 
.// 
	GetBase36// %
(//% &
$num//& '
)//' (
;//( )
}00 	
}22 
}33 Œ
kC:\Users\Dylan Picus\Documents\Vault\ICT\S3-DB01\MusicBlend\ChatService\ChatService\Controllers\UniqueId.cs
	namespace 	
ChatService
 
. 
Controllers !
{ 
public 

class 
UniqueId 
{ 
private 
static 
readonly 
char  $
[$ %
]% &
Base62Chars' 2
=3 4
$str5 u
.		 
ToCharArray		 
(		 
)		 
;		 
private 
static 
readonly 
Random  &
Random' -
=. /
new0 3
Random4 :
(: ;
); <
;< =
public 
string 
	GetBase36 
(  
int  #
length$ *
)* +
{ 	
var 
sb 
= 
new 
StringBuilder &
(& '
length' -
)- .
;. /
for 
( 
int 
i 
= 
$num 
; 
i 
< 
length "
;" #
i$ %
++% '
)' (
sb 
. 
Append 
( 
Base62Chars %
[% &
Random& ,
., -
Next- 1
(1 2
$num2 4
)4 5
]5 6
)6 7
;7 8
return 
sb 
. 
ToString 
( 
)  
;  !
} 	
} 
} •
|C:\Users\Dylan Picus\Documents\Vault\ICT\S3-DB01\MusicBlend\ChatService\ChatService\Controllers\WeatherForecastController.cs
	namespace 	
ChatService
 
. 
Controllers !
{		 
[

 
ApiController

 
]

 
[ 
Route 

(
 
$str 
) 
] 
public 

class %
WeatherForecastController *
:+ ,
ControllerBase- ;
{ 
private 
static 
readonly 
string  &
[& '
]' (
	Summaries) 2
=3 4
new5 8
[8 9
]9 :
{ 	
$str 
, 
$str !
,! "
$str# +
,+ ,
$str- 3
,3 4
$str5 ;
,; <
$str= C
,C D
$strE L
,L M
$strN S
,S T
$strU a
,a b
$strc n
} 	
;	 

private 
readonly 
ILogger  
<  !%
WeatherForecastController! :
>: ;
_logger< C
;C D
public %
WeatherForecastController (
(( )
ILogger) 0
<0 1%
WeatherForecastController1 J
>J K
loggerL R
)R S
{ 	
_logger 
= 
logger 
; 
} 	
[ 	
HttpGet	 
] 
public 
IEnumerable 
< 
WeatherForecast *
>* +
Get, /
(/ 0
)0 1
{ 	
var 
rng 
= 
new 
Random  
(  !
)! "
;" #
return 

Enumerable 
. 
Range #
(# $
$num$ %
,% &
$num' (
)( )
.) *
Select* 0
(0 1
index1 6
=>7 9
new: =
WeatherForecast> M
{ 
Date   
=   
DateTime   #
.  # $
Now  $ '
.  ' (
AddDays  ( /
(  / 0
index  0 5
)  5 6
,  6 7
TemperatureC!!  
=!!! "
rng!!# &
.!!& '
Next!!' +
(!!+ ,
-!!, -
$num!!- /
,!!/ 0
$num!!1 3
)!!3 4
,!!4 5
Summary"" 
="" 
	Summaries"" '
[""' (
rng""( +
.""+ ,
Next"", 0
(""0 1
	Summaries""1 :
."": ;
Length""; A
)""A B
]""B C
}## 
)## 
.$$ 
ToArray$$ 
($$ 
)$$ 
;$$ 
}%% 	
}&& 
}'' ¨,
cC:\Users\Dylan Picus\Documents\Vault\ICT\S3-DB01\MusicBlend\ChatService\ChatService\Hubs\ChatHub.cs
	namespace		 	
ChatService		
 
.		 
Hubs		 
{

 
public 

class 
ChatHub 
: 
Hub 
< 
IChatClient *
>* +
{ 
private 
readonly  
ICommunityRepository - 
_communityRepository. B
;B C
public 
ChatHub 
(  
ICommunityRepository +
communityRepository, ?
)? @
{ 	 
_communityRepository  
=! "
communityRepository# 6
;6 7
} 	
public 
async 
Task 
SendMessage %
(% &
ChatMessage& 1
message2 9
)9 :
{ 	
await 
Clients 
. 
All 
. 
ReceiveMessage ,
(, -
message- 4
)4 5
;5 6
} 	
public 
async 
Task 
CreateCommunity )
() *
string* 0
communityName1 >
,> ?
string@ F
userIdG M
)M N
{ 	
await 
Groups 
. 
AddToGroupAsync (
(( )
Context) 0
.0 1
ConnectionId1 =
,= >
communityName? L
)L M
;M N
await 
SaveCommunity 
(  
communityName  -
,- .
userId/ 5
,5 6
Context7 >
.> ?
ConnectionId? K
)K L
;L M
} 	
public   
async   
Task   
JoinCommunity   '
(  ' (
string  ( .
userId  / 5
,  5 6
string  7 =
roomCode  > F
)  F G
{!! 	
var%% 
	community%% 
=%% 
await%% ! 
_communityRepository%%" 6
.%%6 7
FindCommunity%%7 D
(%%D E
roomCode%%E M
)%%M N
;%%N O
bool)) 

userExists)) 
=)) 
await)) # 
_communityRepository))$ 8
.))8 9

UserExists))9 C
())C D
userId))D J
)))J K
;))K L
if++ 
(++ 

userExists++ 
)++ 
{,, 
await..  
_communityRepository.. *
...* +
AddUserToCommunity..+ =
(..= >
userId..> D
,..D E
roomCode..F N
)..N O
;..O P
}// 
else00 
{11 
User22 
newUser22 
=22 
new22 "
User22# '
(22' (
)22( )
{33 
Id44 
=44 
userId44 
,44  
}55 
;55 
await66  
_communityRepository66 *
.66* +

CreateUser66+ 5
(665 6
newUser666 =
)66= >
;66> ?
}88 
}99 	
private@@ 
async@@ 
Task@@ 
SaveCommunity@@ (
(@@( )
string@@) /
communityName@@0 =
,@@= >
string@@? E
userId@@F L
,@@L M
string@@N T
connectionId@@U a
)@@a b
{AA 	
ifCC 
(CC 
awaitCC  
_communityRepositoryCC *
.CC* +

UserExistsCC+ 5
(CC5 6
userIdCC6 <
)CC< =
)CC= >
{DD 
}FF 

ConnectionHH 
newConnectionHH $
=HH% &
newHH' *

ConnectionHH+ 5
(HH5 6
)HH6 7
{II 
ConnectionIdJJ 
=JJ 
connectionIdJJ +
}KK 
;KK 
UserMM 
	firstUserMM 
=MM 
newMM  
UserMM! %
(MM% &
)MM& '
{NN 
IdOO 
=OO 
userIdOO 
}PP 
;PP 
	CommunityRR 
newCommunityRR "
=RR# $
newRR% (
	CommunityRR) 2
(RR2 3
)RR3 4
{SS 
IdTT 
=TT 
GuidTT 
.TT 
NewGuidTT !
(TT! "
)TT" #
,TT# $
CommunityNameUU 
=UU 
communityNameUU  -
,UU- .
RoomCodeVV 
=VV 
GenerateRoomCodeVV +
(VV+ ,
)VV, -
,VV- .
}WW 
;WW 
	firstUserXX 
.XX 
ConnectionsXX !
.XX! "
AddXX" %
(XX% &
newConnectionXX& 3
)XX3 4
;XX4 5
newCommunityYY 
.YY 
UsersYY 
.YY 
AddYY "
(YY" #
	firstUserYY# ,
)YY, -
;YY- .
awaitZZ  
_communityRepositoryZZ &
.ZZ& '
CreateCommunityZZ' 6
(ZZ6 7
newCommunityZZ7 C
)ZZC D
;ZZD E
}[[ 	
private\\ 
string\\ 
GenerateRoomCode\\ '
(\\' (
)\\( )
{]] 	
UniqueId^^ 
uniqueId^^ 
=^^ 
new^^  #
UniqueId^^$ ,
(^^, -
)^^- .
;^^. /
return__ 
uniqueId__ 
.__ 
	GetBase36__ %
(__% &
$num__& '
)__' (
;__( )
}`` 	
}aa 
}bb é
oC:\Users\Dylan Picus\Documents\Vault\ICT\S3-DB01\MusicBlend\ChatService\ChatService\Hubs\Clients\IChatClient.cs
	namespace 	
ChatService
 
. 
Hubs 
. 
Clients "
{ 
public 

	interface 
IChatClient  
{ 
Task 
ReceiveMessage 
( 
ChatMessage '
message( /
)/ 0
;0 1
} 
} ·

^C:\Users\Dylan Picus\Documents\Vault\ICT\S3-DB01\MusicBlend\ChatService\ChatService\Program.cs
	namespace

 	
ChatService


 
{ 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
CreateHostBuilder 
( 
args "
)" #
.# $
Build$ )
() *
)* +
.+ ,
Run, /
(/ 0
)0 1
;1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{8 9

webBuilder: D
.D E

UseStartupE O
<O P
StartupP W
>W X
(X Y
)Y Z
;Z [
}\ ]
)] ^
;^ _
} 
} Ë!
^C:\Users\Dylan Picus\Documents\Vault\ICT\S3-DB01\MusicBlend\ChatService\ChatService\Startup.cs
	namespace 	
ChatService
 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
services 
. 
AddControllers #
(# $
)$ %
;% &
services   
.   
AddSwaggerGen   "
(  " #
c  # $
=>  % '
{!! 
c"" 
."" 

SwaggerDoc"" 
("" 
$str"" !
,""! "
new""# &
OpenApiInfo""' 2
{""3 4
Title""4 9
="": ;
$str""< I
,""I J
Version""K R
=""S T
$str""U Y
}""Y Z
)""Z [
;""[ \
}## 
)## 
;## 
services%% 
.%% 

AddSignalR%% 
(%%  
)%%  !
;%%! "
services&& 
.&& 
AddCors&& 
(&& 
options&& $
=>&&% '
{'' 
options(( 
.(( 
	AddPolicy(( !
(((! "
$str((" 4
,((4 5
policy((6 <
=>((= ?
{)) 
policy** 
.** 
AllowAnyHeader** )
(**) *
)*** +
.++ 
AllowAnyMethod++ '
(++' (
)++( )
.,, 
WithOrigins,, $
(,,$ %
$str,,% <
),,< =
.-- 
AllowCredentials-- )
(--) *
)--* +
;--+ ,
}.. 
).. 
;.. 
}// 
)// 
;// 
services22 
.22 
AddPersistence22 #
(22# $
Configuration22$ 1
.221 2
GetValue222 :
<22: ;
string22; A
>22A B
(22B C
$str22C U
)22U V
)22V W
;22W X
}33 	
public66 
void66 
	Configure66 
(66 
IApplicationBuilder66 1
app662 5
,665 6
IWebHostEnvironment667 J
env66K N
)66N O
{77 	
if88 
(88 
env88 
.88 
IsDevelopment88 !
(88! "
)88" #
)88# $
{99 
app:: 
.:: %
UseDeveloperExceptionPage:: -
(::- .
)::. /
;::/ 0
app;; 
.;; 

UseSwagger;; 
(;; 
);;  
;;;  !
app<< 
.<< 
UseSwaggerUI<<  
(<<  !
c<<! "
=><<# %
c<<& '
.<<' (
SwaggerEndpoint<<( 7
(<<7 8
$str<<8 R
,<<R S
$str<<T d
)<<d e
)<<e f
;<<f g
}== 
app?? 
.?? 
UseHttpsRedirection?? #
(??# $
)??$ %
;??% &
app@@ 
.@@ 
UseCors@@ 
(@@ 
$str@@ *
)@@* +
;@@+ ,
appAA 
.AA 

UseRoutingAA 
(AA 
)AA 
;AA 
appCC 
.CC 
UseAuthorizationCC  
(CC  !
)CC! "
;CC" #
appEE 
.EE 
UseEndpointsEE 
(EE 
	endpointsEE &
=>EE' )
{FF 
	endpointsGG 
.GG 
MapControllersGG (
(GG( )
)GG) *
;GG* +
	endpointsHH 
.HH 
MapHubHH  
<HH  !
ChatHubHH! (
>HH( )
(HH) *
$strHH* 6
)HH6 7
;HH7 8
}II 
)II 
;II 
}JJ 	
}KK 
}LL ë
fC:\Users\Dylan Picus\Documents\Vault\ICT\S3-DB01\MusicBlend\ChatService\ChatService\WeatherForecast.cs
	namespace 	
ChatService
 
{ 
public 

class 
WeatherForecast  
{ 
public 
DateTime 
Date 
{ 
get "
;" #
set$ '
;' (
}) *
public		 
int		 
TemperatureC		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
public 
int 
TemperatureF 
=>  "
$num# %
+& '
(( )
int) ,
), -
(. /
TemperatureC/ ;
/< =
$num> D
)D E
;E F
public 
string 
Summary 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} 