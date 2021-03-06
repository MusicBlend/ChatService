?
tC:\Users\Dylan Picus\Documents\Vault\ICT\S3-DB01\MusicBlend\ChatService\ChatService.Persistence\Data\AppDbContext.cs
	namespace 	
ChatService
 
. 
Persistence !
.! "
Data" &
{ 
public 

class 
AppDbContext 
: 
	DbContext  )
{ 
public 
AppDbContext 
( 
DbContextOptions ,
<, -
AppDbContext- 9
>9 :
options; B
)B C
:D E
baseF J
(J K
optionsK R
)R S
{		 	
} 	
public 
DbSet 
< 
ChatMessage  
>  !
ChatMessages" .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
DbSet 
< 
	Community 
> 
Communities  +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
DbSet 
< 
User 
> 
Users  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
DbSet 
< 

Connection 
>  
Connections! ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
} 
} ?
vC:\Users\Dylan Picus\Documents\Vault\ICT\S3-DB01\MusicBlend\ChatService\ChatService.Persistence\DependencyInjection.cs
	namespace

 	
ChatService


 
.

 
Persistence

 !
{ 
public 

static 
class 
DependencyInjection +
{ 
public 
static 
IServiceCollection (
AddPersistence) 7
(7 8
this8 <
IServiceCollection= O
servicesP X
,X Y
stringZ `
connectionStringa q
)q r
{ 	
services 
. 
AddDbContext !
<! "
AppDbContext" .
>. /
(/ 0
x0 1
=>2 4
{ 
x 
. 
UseMySql 
( 
connectionString (
,( )
new  
MariaDbServerVersion 0
(0 1
new1 4
Version5 <
(< =
$num= ?
,? @
$numA B
,B C
$numD E
)E F
)F G
,G H
mysqlOptions $
=>% '
mysqlOptions( 4
.4 5
CharSetBehavior5 D
(D E
CharSetBehaviorE T
.T U
NeverAppendU `
)` a
)a b
. &
EnableSensitiveDataLogging /
(/ 0
)0 1
.  
EnableDetailedErrors )
() *
)* +
;+ ,
} 
) 
; 
services 
. 
AddTransient !
<! ""
IChatMessageRepository" 8
,8 9!
ChatMessageRepository: O
>O P
(P Q
)Q R
;R S
services 
. 
AddTransient !
<! " 
ICommunityRepository" 6
,6 7
CommunityRepository8 K
>K L
(L M
)M N
;N O
services 
. 
AddTransient !
<! "
IUserRepository" 1
,1 2
UserRepository3 A
>A B
(B C
)C D
;D E
return 
services 
; 
} 	
}   
}!! ?b
?C:\Users\Dylan Picus\Documents\Vault\ICT\S3-DB01\MusicBlend\ChatService\ChatService.Persistence\Migrations\20210412151911_initialMig.cs
	namespace 	
ChatService
 
. 
Persistence !
.! "

Migrations" ,
{ 
public 

partial 
class 

initialMig #
:$ %
	Migration& /
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{		 	
migrationBuilder

 
.

 
CreateTable

 (
(

( )
name 
: 
$str #
,# $
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
Guid& *
>* +
(+ ,
type, 0
:0 1
$str2 <
,< =
nullable> F
:F G
falseH M
)M N
,N O
CommunityName !
=" #
table$ )
.) *
Column* 0
<0 1
string1 7
>7 8
(8 9
type9 =
:= >
$str? I
,I J
nullableK S
:S T
trueU Y
)Y Z
,Z [
RoomCode 
= 
table $
.$ %
Column% +
<+ ,
string, 2
>2 3
(3 4
type4 8
:8 9
$str: D
,D E
nullableF N
:N O
trueP T
)T U
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 5
,5 6
x7 8
=>9 ;
x< =
.= >
Id> @
)@ A
;A B
} 
) 
; 
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str 
, 
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
string& ,
>, -
(- .
type. 2
:2 3
$str4 B
,B C
nullableD L
:L M
falseN S
)S T
,T U
Name 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
type0 4
:4 5
$str6 @
,@ A
nullableB J
:J K
trueL P
)P Q
,Q R
Admin 
= 
table !
.! "
Column" (
<( )
bool) -
>- .
(. /
type/ 3
:3 4
$str5 A
,A B
nullableC K
:K L
falseM R
)R S
} 
, 
constraints 
: 
table "
=># %
{   
table!! 
.!! 

PrimaryKey!! $
(!!$ %
$str!!% /
,!!/ 0
x!!1 2
=>!!3 5
x!!6 7
.!!7 8
Id!!8 :
)!!: ;
;!!; <
}"" 
)"" 
;"" 
migrationBuilder$$ 
.$$ 
CreateTable$$ (
($$( )
name%% 
:%% 
$str%% $
,%%$ %
columns&& 
:&& 
table&& 
=>&& !
new&&" %
{'' 
Id(( 
=(( 
table(( 
.(( 
Column(( %
<((% &
Guid((& *
>((* +
(((+ ,
type((, 0
:((0 1
$str((2 <
,((< =
nullable((> F
:((F G
false((H M
)((M N
,((N O
User)) 
=)) 
table))  
.))  !
Column))! '
<))' (
string))( .
>)). /
())/ 0
type))0 4
:))4 5
$str))6 @
,))@ A
nullable))B J
:))J K
true))L P
)))P Q
,))Q R
Message** 
=** 
table** #
.**# $
Column**$ *
<*** +
string**+ 1
>**1 2
(**2 3
type**3 7
:**7 8
$str**9 C
,**C D
nullable**E M
:**M N
true**O S
)**S T
,**T U
SendDate++ 
=++ 
table++ $
.++$ %
Column++% +
<+++ ,
DateTime++, 4
>++4 5
(++5 6
type++6 :
:++: ;
$str++< I
,++I J
nullable++K S
:++S T
false++U Z
)++Z [
,++[ \
CommunityId,, 
=,,  !
table,," '
.,,' (
Column,,( .
<,,. /
Guid,,/ 3
>,,3 4
(,,4 5
type,,5 9
:,,9 :
$str,,; E
,,,E F
nullable,,G O
:,,O P
true,,Q U
),,U V
}-- 
,-- 
constraints.. 
:.. 
table.. "
=>..# %
{// 
table00 
.00 

PrimaryKey00 $
(00$ %
$str00% 6
,006 7
x008 9
=>00: <
x00= >
.00> ?
Id00? A
)00A B
;00B C
table11 
.11 

ForeignKey11 $
(11$ %
name22 
:22 
$str22 G
,22G H
column33 
:33 
x33  !
=>33" $
x33% &
.33& '
CommunityId33' 2
,332 3
principalTable44 &
:44& '
$str44( 5
,445 6
principalColumn55 '
:55' (
$str55) -
,55- .
onDelete66  
:66  !
ReferentialAction66" 3
.663 4
Restrict664 <
)66< =
;66= >
}77 
)77 
;77 
migrationBuilder99 
.99 
CreateTable99 (
(99( )
name:: 
::: 
$str:: %
,::% &
columns;; 
:;; 
table;; 
=>;; !
new;;" %
{<< 
CommunitiesId== !
===" #
table==$ )
.==) *
Column==* 0
<==0 1
Guid==1 5
>==5 6
(==6 7
type==7 ;
:==; <
$str=== G
,==G H
nullable==I Q
:==Q R
false==S X
)==X Y
,==Y Z
UsersId>> 
=>> 
table>> #
.>># $
Column>>$ *
<>>* +
string>>+ 1
>>>1 2
(>>2 3
type>>3 7
:>>7 8
$str>>9 G
,>>G H
nullable>>I Q
:>>Q R
false>>S X
)>>X Y
}?? 
,?? 
constraints@@ 
:@@ 
table@@ "
=>@@# %
{AA 
tableBB 
.BB 

PrimaryKeyBB $
(BB$ %
$strBB% 7
,BB7 8
xBB9 :
=>BB; =
newBB> A
{BBB C
xBBD E
.BBE F
CommunitiesIdBBF S
,BBS T
xBBU V
.BBV W
UsersIdBBW ^
}BB_ `
)BB` a
;BBa b
tableCC 
.CC 

ForeignKeyCC $
(CC$ %
nameDD 
:DD 
$strDD J
,DDJ K
columnEE 
:EE 
xEE  !
=>EE" $
xEE% &
.EE& '
CommunitiesIdEE' 4
,EE4 5
principalTableFF &
:FF& '
$strFF( 5
,FF5 6
principalColumnGG '
:GG' (
$strGG) -
,GG- .
onDeleteHH  
:HH  !
ReferentialActionHH" 3
.HH3 4
CascadeHH4 ;
)HH; <
;HH< =
tableII 
.II 

ForeignKeyII $
(II$ %
nameJJ 
:JJ 
$strJJ >
,JJ> ?
columnKK 
:KK 
xKK  !
=>KK" $
xKK% &
.KK& '
UsersIdKK' .
,KK. /
principalTableLL &
:LL& '
$strLL( /
,LL/ 0
principalColumnMM '
:MM' (
$strMM) -
,MM- .
onDeleteNN  
:NN  !
ReferentialActionNN" 3
.NN3 4
CascadeNN4 ;
)NN; <
;NN< =
}OO 
)OO 
;OO 
migrationBuilderQQ 
.QQ 
CreateTableQQ (
(QQ( )
nameRR 
:RR 
$strRR #
,RR# $
columnsSS 
:SS 
tableSS 
=>SS !
newSS" %
{TT 
ConnectionIdUU  
=UU! "
tableUU# (
.UU( )
ColumnUU) /
<UU/ 0
stringUU0 6
>UU6 7
(UU7 8
typeUU8 <
:UU< =
$strUU> L
,UUL M
nullableUUN V
:UUV W
falseUUX ]
)UU] ^
,UU^ _
UserIdVV 
=VV 
tableVV "
.VV" #
ColumnVV# )
<VV) *
stringVV* 0
>VV0 1
(VV1 2
typeVV2 6
:VV6 7
$strVV8 F
,VVF G
nullableVVH P
:VVP Q
trueVVR V
)VVV W
}WW 
,WW 
constraintsXX 
:XX 
tableXX "
=>XX# %
{YY 
tableZZ 
.ZZ 

PrimaryKeyZZ $
(ZZ$ %
$strZZ% 5
,ZZ5 6
xZZ7 8
=>ZZ9 ;
xZZ< =
.ZZ= >
ConnectionIdZZ> J
)ZZJ K
;ZZK L
table[[ 
.[[ 

ForeignKey[[ $
([[$ %
name\\ 
:\\ 
$str\\ ;
,\\; <
column]] 
:]] 
x]]  !
=>]]" $
x]]% &
.]]& '
UserId]]' -
,]]- .
principalTable^^ &
:^^& '
$str^^( /
,^^/ 0
principalColumn__ '
:__' (
$str__) -
,__- .
onDelete``  
:``  !
ReferentialAction``" 3
.``3 4
Restrict``4 <
)``< =
;``= >
}aa 
)aa 
;aa 
migrationBuildercc 
.cc 
CreateIndexcc (
(cc( )
namedd 
:dd 
$strdd 3
,dd3 4
tableee 
:ee 
$stree %
,ee% &
columnff 
:ff 
$strff %
)ff% &
;ff& '
migrationBuilderhh 
.hh 
CreateIndexhh (
(hh( )
nameii 
:ii 
$strii 0
,ii0 1
tablejj 
:jj 
$strjj &
,jj& '
columnkk 
:kk 
$strkk !
)kk! "
;kk" #
migrationBuildermm 
.mm 
CreateIndexmm (
(mm( )
namenn 
:nn 
$strnn -
,nn- .
tableoo 
:oo 
$stroo $
,oo$ %
columnpp 
:pp 
$strpp  
)pp  !
;pp! "
}qq 	
	protectedss 
overridess 
voidss 
Downss  $
(ss$ %
MigrationBuilderss% 5
migrationBuilderss6 F
)ssF G
{tt 	
migrationBuilderuu 
.uu 
	DropTableuu &
(uu& '
namevv 
:vv 
$strvv $
)vv$ %
;vv% &
migrationBuilderxx 
.xx 
	DropTablexx &
(xx& '
nameyy 
:yy 
$stryy %
)yy% &
;yy& '
migrationBuilder{{ 
.{{ 
	DropTable{{ &
({{& '
name|| 
:|| 
$str|| #
)||# $
;||$ %
migrationBuilder~~ 
.~~ 
	DropTable~~ &
(~~& '
name 
: 
$str #
)# $
;$ %
migrationBuilder
?? 
.
?? 
	DropTable
?? &
(
??& '
name
?? 
:
?? 
$str
?? 
)
?? 
;
?? 
}
?? 	
}
?? 
}?? ?
?C:\Users\Dylan Picus\Documents\Vault\ICT\S3-DB01\MusicBlend\ChatService\ChatService.Persistence\Migrations\20210423114817_removedUsername.cs
	namespace 	
ChatService
 
. 
Persistence !
.! "

Migrations" ,
{ 
public 

partial 
class 
removedUsername (
:) *
	Migration+ 4
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder		 
.		 

DropColumn		 '
(		' (
name

 
:

 
$str

 
,

 
table 
: 
$str 
) 
;  
migrationBuilder 
. 

DropColumn '
(' (
name 
: 
$str 
, 
table 
: 
$str 
) 
;  
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
migrationBuilder 
. 
	AddColumn &
<& '
bool' +
>+ ,
(, -
name 
: 
$str 
, 
table 
: 
$str 
, 
type 
: 
$str "
," #
nullable 
: 
false 
,  
defaultValue 
: 
false #
)# $
;$ %
migrationBuilder 
. 
	AddColumn &
<& '
string' -
>- .
(. /
name 
: 
$str 
, 
table 
: 
$str 
, 
type 
: 
$str  
,  !
nullable 
: 
true 
) 
;  
}   	
}!! 
}"" ?
?C:\Users\Dylan Picus\Documents\Vault\ICT\S3-DB01\MusicBlend\ChatService\ChatService.Persistence\Repository\ChatMessageRepository.cs
	namespace 	
ChatService
 
. 
Persistence !
.! "

Repository" ,
{ 
public 

class !
ChatMessageRepository &
:' ("
IChatMessageRepository) ?
{ 
}		 
}

 ?%
?C:\Users\Dylan Picus\Documents\Vault\ICT\S3-DB01\MusicBlend\ChatService\ChatService.Persistence\Repository\CommunityRepository.cs
	namespace

 	
ChatService


 
.

 
Persistence

 !
.

! "

Repository

" ,
{ 
public 

class 
CommunityRepository $
:% & 
ICommunityRepository' ;
{ 
private 
readonly 
AppDbContext %

_dbContext& 0
;0 1
public 
CommunityRepository "
(" #
AppDbContext# /
	dbContext0 9
)9 :
{ 	

_dbContext 
= 
	dbContext "
;" #
} 	
public 
async 
Task 
CreateCommunity )
() *
	Community* 3
newCommunity4 @
)@ A
{ 	
await 

_dbContext 
. 
Communities '
.' (
AddAsync( 0
(0 1
newCommunity1 =
)= >
;> ?
await 

_dbContext 
. 
SaveChangesAsync ,
(, -
)- .
;. /
} 	
public 
async 
Task 

CreateUser $
($ %
User% )
user* .
). /
{ 	
await 

_dbContext 
. 
Users "
." #
AddAsync# +
(+ ,
user, 0
)0 1
;1 2
await 

_dbContext 
. 
SaveChangesAsync -
(- .
). /
;/ 0
} 	
public   
async   
Task   
<   
	Community   #
>  # $
FindCommunity  % 2
(  2 3
string  3 9
roomCode  : B
)  B C
{!! 	
	Community"" 
comm"" 
="" 
new""  
	Community""! *
(""* +
)""+ ,
;"", -
var## 
	community## 
=## 
await## !

_dbContext##" ,
.##, -
Communities##- 8
.##8 9
FirstOrDefaultAsync##9 L
(##L M
x##M N
=>##O Q
x##R S
.##S T
RoomCode##T \
==##] _
roomCode##` h
)##h i
;##i j
comm$$ 
=$$ 
	community$$ 
;$$ 
return%% 
comm%% 
;%% 
}&& 	
public(( 
async(( 
Task(( 
<(( 
bool(( 
>(( 

UserExists((  *
(((* +
string((+ 1
userId((2 8
)((8 9
{)) 	
var** 
user** 
=** 
await** 

_dbContext** '
.**' (
Users**( -
.**- .
	FindAsync**. 7
(**7 8
userId**8 >
)**> ?
;**? @
return++ 
user++ 
!=++ 
null++ 
;++  
},, 	
public-- 
async-- 
Task-- 
<-- 
User-- 
>-- 
GetUser--  '
(--' (
string--( .
userId--/ 5
)--5 6
{.. 	
var// 
user// 
=// 
await// 

_dbContext// '
.//' (
Users//( -
.//- .
	FindAsync//. 7
(//7 8
userId//8 >
)//> ?
;//? @
return00 
user00 
;00 
}11 	
public22 
async22 
Task22 
AddUserToCommunity22 ,
(22, -
string22- 3
userId224 :
,22: ;
string22< B
roomCode22C K
)22K L
{33 	
var44 
	community44 
=44 
await44 !

_dbContext44" ,
.44, -
Communities44- 8
.448 9
FirstOrDefaultAsync449 L
(44L M
x44M N
=>44O Q
x44R S
.44S T
RoomCode44T \
==44] _
roomCode44` h
)44h i
;44i j
var55 
user55 
=55 
await55 

_dbContext55 '
.55' (
Users55( -
.55- .
	FindAsync55. 7
(557 8
userId558 >
)55> ?
;55? @

_dbContext77 
.77 
Communities77 "
.77" #
Update77# )
(77) *
	community77* 3
)773 4
;774 5
await88 

_dbContext88 
.88 
SaveChangesAsync88 -
(88- .
)88. /
;88/ 0
}99 	
}:: 
};; ?
|C:\Users\Dylan Picus\Documents\Vault\ICT\S3-DB01\MusicBlend\ChatService\ChatService.Persistence\Repository\UserRepository.cs
	namespace 	
ChatService
 
. 
Persistence !
.! "

Repository" ,
{ 
public 

class 
UserRepository 
:  !
IUserRepository" 1
{ 
} 
}		 