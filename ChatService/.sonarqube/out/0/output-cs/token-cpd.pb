«
rC:\Users\Dylan Picus\Documents\Vault\ICT\S3-DB01\MusicBlend\ChatService\ChatService.Domain\Entities\ChatMessage.cs
	namespace 	
ChatService
 
. 
Domain 
. 
Entities %
{ 
public 

class 
ChatMessage 
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
string 
User 
{ 
get  
;  !
set" %
;% &
}' (
public		 
string		 
Message		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
public

 
DateTime

 
SendDate

  
{

! "
get

# &
;

& '
set

( +
;

+ ,
}

- .
} 
} è
pC:\Users\Dylan Picus\Documents\Vault\ICT\S3-DB01\MusicBlend\ChatService\ChatService.Domain\Entities\Community.cs
	namespace 	
ChatService
 
. 
Domain 
. 
Entities %
{ 
public 

class 
	Community 
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public		 
string		 
CommunityName		 #
{		$ %
get		& )
;		) *
set		+ .
;		. /
}		0 1
public

 
string

 
RoomCode

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
public 
ICollection 
< 
ChatMessage &
>& '
Messages( 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
=? @
newA D
ListE I
<I J
ChatMessageJ U
>U V
(V W
)W X
;X Y
public 
virtual 
ICollection "
<" #
User# '
>' (
Users) .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
== >
new? B
ListC G
<G H
UserH L
>L M
(M N
)N O
;O P
} 
} Ä
qC:\Users\Dylan Picus\Documents\Vault\ICT\S3-DB01\MusicBlend\ChatService\ChatService.Domain\Entities\Connection.cs
	namespace 	
ChatService
 
. 
Domain 
. 
Entities %
{ 
public 

class 

Connection 
{ 
public 
string 
ConnectionId "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
}		 €	
kC:\Users\Dylan Picus\Documents\Vault\ICT\S3-DB01\MusicBlend\ChatService\ChatService.Domain\Entities\User.cs
	namespace 	
ChatService
 
. 
Domain 
. 
Entities %
{ 
public 

class 
User 
{ 
public		 
string		 
Id		 
{		 
get		 
;		 
set		  #
;		# $
}		% &
public

 
ICollection

 
<

 

Connection

 %
>

% &
Connections

' 2
{

3 4
get

5 8
;

8 9
set

: =
;

= >
}

? @
=

A B
new

C F
List

G K
<

K L

Connection

L V
>

V W
(

W X
)

X Y
;

Y Z
public 
virtual 
ICollection "
<" #
	Community# ,
>, -
Communities. 9
{: ;
get< ?
;? @
setA D
;D E
}F G
=H I
newJ M
ListN R
<R S
	CommunityS \
>\ ]
(] ^
)^ _
;_ `
} 
} µ
ãC:\Users\Dylan Picus\Documents\Vault\ICT\S3-DB01\MusicBlend\ChatService\ChatService.Domain\Interfaces\IRepository\IChatMessageRepository.cs
	namespace 	
ChatService
 
. 
Domain 
. 

Interfaces '
.' (
IRepository( 3
{ 
public 

	interface "
IChatMessageRepository +
{ 
} 
} ç
âC:\Users\Dylan Picus\Documents\Vault\ICT\S3-DB01\MusicBlend\ChatService\ChatService.Domain\Interfaces\IRepository\ICommunityRepository.cs
	namespace 	
ChatService
 
. 
Domain 
. 

Interfaces '
.' (
IRepository( 3
{ 
public 

	interface  
ICommunityRepository )
{ 
Task 
CreateCommunity 
( 
	Community &
newCommunity' 3
)3 4
;4 5
Task		 
<		 
	Community		 
>		 
FindCommunity		 %
(		% &
string		& ,
roomCode		- 5
)		5 6
;		6 7
Task

 
<

 
bool

 
>

 

UserExists

 
(

 
string

 $
userId

% +
)

+ ,
;

, -
Task 
< 
User 
> 
GetUser 
( 
string !
userId" (
)( )
;) *
Task 

CreateUser 
( 
User 
user !
)! "
;" #
Task 
AddUserToCommunity 
(  
string  &
userId' -
,- .
string/ 5
roomCode6 >
)> ?
;? @
} 
} ß
ÑC:\Users\Dylan Picus\Documents\Vault\ICT\S3-DB01\MusicBlend\ChatService\ChatService.Domain\Interfaces\IRepository\IUserRepository.cs
	namespace 	
ChatService
 
. 
Domain 
. 

Interfaces '
.' (
IRepository( 3
{ 
public 

	interface 
IUserRepository $
{ 
} 
} 