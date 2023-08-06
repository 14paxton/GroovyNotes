-   crea@groovy.transform.ToString

    -   Used for classes to establish to string

-   Strings

    -   ''' ... ''' three single quotes creates a multiline string obj

    -   Str -= "rainy" will remove rainy from the string

    -   Use stripIndent() or stripMargin() remove indents

        -   stripMargin('char') indicates what lines, or \| by default

\"\"\"\<p\>\<strong\>Scheduled Interview Summary\</strong\>\</p\>\
\|\<p\>\<strong\>Company\</strong\>:
@@company@@\<br\>\"\"\".stripMargin()

-   

```{=html}
<!-- -->
```
-   \"abc\".tr(\'abc\', \'321\')

    -   Replace characters in string

-   Java char saved as int per ascii

    -   Def x = 'a'

    -   (int)x -96 = 1

-   Splitting strings

    -   The split() method returns a string \[\] instance and the
        tokenize() method returns a list instance

    -   tokenize() ,which returns a list, will ignore empty string (when
        a delimiter appears twice in succession) where as split() keeps
        such string.

-   Slice word\[0..3\]

    -   Will get letters at index 0 through 3

    -   word\[1,6,0\] get letters index 1,6, and 0

```{=html}
<!-- -->
```
-   RegEX

    -   =\~ will look for partial match ==\~ look for an exact match

    -   Use with replace and findall

        -   *\"LBlsBF4wUp\".replaceAll(/\[\\d\\sa-zA-Z.!?\\\\-\\\\\'\]/)*

    -   Use groups

def replacedTxt = txt.replaceAll(/.\*(\\d{2}-\\d{2}-\\d{4}).\*(Gr.\*)./)
{ all, date, lang -\>

    def dateObj = Date.parse(\'dd-MM-yyyy\', date)

    \"The text \'\$all\' was created with \$lang on a
\${dateObj.format(\'EEEE\')}.\"

}

-   Array

    -   Int \[\] arr = \[1, 2, 3\]

-   To loop

    -   20.times {print}

    -   1.upto(10) {num -\> println}

    -   10.downto(1)

    -   0.step(1, 0.1)

-   List

    -   Def list = \[1,2,3,..\]

    -   List.size

    -   List \<\<

    -   List.push adds item

    -   List.putat(0, )

    -   List\[1\] = 77

    -   List. Removeat

        -   Remove(1) removes at index 1, Remove("c") removes element
            with that value

    -   List.removeAll{it == 2}

        -   Better remove all removes list from list also
            list.removeall(list2)

        -   userAuthList -= grantedAuthListToRemove

    -   

    -   List.minus

    -   List --\[object\]

    -   List.pop remove last item

    -   List. Getat (0..3) range

    -   List.clear

    -   For(x in list){print x}

    -   List.flatten for lists in lists

        -   The result is a flattened single List of objects: from
            \[\[1,2\], 1, 2\] to \[1,2,1,2\]

    -   List.unique

    -   List.each {print it}

    -   arr.withIndex().findIndexOf {element, index -\> isEven(element)}

        -   creates list of tuples \[\[element, index\] , \[element,
            index\]\]

    -   arr.indexed().findIndexOf { e -\> fn(e.value, e.key) }

        -   creates map

    -   

    -   List.find { it == 2}

        -   List.findAll {it \>= 2}

        -   user.dam = damList.find {it.userId == user.id }.damName

            -   Finding and getting a specific value

    -   List.join(' ')

        -   join() iterates over each element, concatenating every
            element with the character given as the input parameter.

    -   list\[-1\]

        -   Using negative numbers starts on the right, this will get
            the last number

    -   

    -   list.reverseEach {}

        -   runs list in reverse closuer

    -   list.eachWithIndex{}

    -   list.reverse(true)

        -   returns list in reverse in place

    -   list.collect{it\*2}

        -   The collect() method, like each(), invokes the closure for
            each element of the

> collection. However, it collects the return value from the closure
> into a collection and finally returns that resulting collection

-   Mylist.sum()

-   List.drop(3)

    -   Will drop first 3 elements, does not change array

-   List.retainAll{}

    -   Returns boolean

    -   Modifies this collection so that it retains only its elements
        that are matched according to the specified closure condition.
        In other words, removes from this collection all of its elements
        that don\'t match.

-   List.removeAll{}

    -   Opposite of retain

-   Mylist.inject {variable, element -\> variable + element.size()}

-   // With the inject method we \'inject\' the

-   // first value of the result, and then for

-   // each item the result is increased and

-   // returned for the next iteration.

-   def sum = (1..4).inject(0) { result, i -\> result + i }

-   assert 10 == sum

    -   

-   Mylist.addall(secondlist)

    -   Merges two lists

    -   Modifies in place

-   Mylist.intersect

    -   Gets similar elements

-   Mylist.disjoint

    -   Tests if there are common elements, if not returns true

-   list.any()

    -   Checks if any element meets condition return Boolean

-   list.every()

    -   checks if every element meets condition returns Boolean

    -   fyi - groovy every closure will return true if empty list, even
        though condition is not met

-   println Employee.list().findResults{it.salary\>25000?(firstName+\'
    \'+lastName):null}

    -   use condition and mutate return

-   list.collectMany { \[it, it.toUpperCase()\] }

    -    transform items from a collection into a collection. The
        resulting collection is then flattened into a single collection

    -   If you want original elements and modified elements in same
        collection

    -   ![](/Users/bpaxton/IdeaProjects/tbcore/media/image1.png){width="4.576818678915136in"
        height="0.8664665354330708in"}

-   List.collate(size)

    -   is a method on any Iterable to split or partition its elements
        into a sub-list of a certain size

-   list.groupBy{}

    -   The result is a map where the key is the grouping condition and
        the value contains the elements of the Collection type belonging
        to the key

-   List.collectEntries{}

    -   Groovy collectEntries iterates over a collection and return a
        Map based on the manipulations

> -example using groupBy and collectEntries

savedUserResponses.groupBy{it.fitGuideType}.collectEntries {

\[it.key, it.value.collectEntries {\[(\'Q\'+
it.questionNumber.toString()): it.rating\]}\]

}

-list of strings to long

sharedGroupIds?.collect{Long.valueOf(it)}

-paginate or split list substring(beginning index, ending index)

Paginate

> -response.sort{it.groupName}.subList( Math.min( 5 as Integer, 21 ),
> Math.min( (5 as Integer) + (10 as Integer), 21 ) )

-   Maps

    -   [Def map = \[key : value\]]{.underline}

    -   [Map.put('key', 'value')]{.underline}

    -   [Map\['yourKey'\] = yourValue]{.underline}

    -   [Map.'yourKey' = yourValue]{.underline}

    -   [Map \<\< \[yourKey : yourValue\]]{.underline}

        -   [Create or add to map]{.underline}

    -   [To use a variable as key, put variable in ()]{.underline}

    -   Map .values print only values

    -   Map.keySet()

        -   Get list of keys

    -   Map.'key'

        -   Will get value

    -   Map.find {key, value -\> value.size() \>3}

        -   mymap.find{ it.key == \"likes\" }?.value

            -   find and return value

    -   Map.each {key, value -\> println "\$key and \$value"

    -   Map.any()

        -   Checks if any element meets condition return Boolean

    -   Map.every() checks if every element meets condition returns
        Boolean

    -   Map.remove('key') -- removes object in place

    -   Map.minus(\[key : value\]) -- removes map values

    -   Map.getOrDefault()

        -   Returns the value to which the specified key is mapped,
            or defaultValue if this map contains no mapping for the key.

    -   params is a Map, so you can
        use params.containsKey(keyYourWanting):

    -   map.subMap() method. Use list or range of keys to find from a
        map

    -   change key it.put(\'sourceId\', it.remove(\'id\'))

    -   

    -   HQL create map

-   static *List* getGroupsByUser(Long userId, Long clientSetupId, def
    offset = 0, def max = 0, String orderBy = \'ug.name\', String
    orderByDirection = \'asc\'){\
    def query = \"\"\"\
    select new Map(ug.id as id, ug.name as name, ug.interviewModelId as
    interviewModelId,\
    im.name as assessmentName, im.sourceId as sourceId, im.source as
    source, im.subType as subType,\
    ug.visibility as visibility, ugs.id is not null as shared ,
    ug.lastUpdated as lastUpdated , COUNT(ugao.id) as assessmentCount)\
    from UserGroup ug\
    LEFT JOIN UserGroupAssessmentOrder ugao ON ug.id= ugao.userGroupId\
    LEFT JOIN ug.userGroupShare ugs ON ug.id = ugs.userGroupId and
    ugs.revoked = false\
    LEFT JOIN InterviewModel im ON im.id = ug.interviewModelId\
    where ug.userId = :userId and ug.type = :type and ug.clientSetupId =
    :clientSetupId\
    GROUP BY ug.id\
    order by \@orderBy@ \@orderByDirection@\"\"\"\
    \
    def modifiedQuery = query.replaceAll(\'@orderBy@\',
    orderBy).replaceAll(\'@orderByDirection@\', orderByDirection)\
    \
    *findAll*(modifiedQuery, \[userId: userId, type:
    UserGroupType.*RESULTGROUP*, clientSetupId:\
    clientSetupId\], \[offset: offset, max: max, cache: true\])\
    }

    -   

    -   Map with closure example

-   shareResultsList = results.findAll{result -\>\
    *def* catalogDetailProperties = \[enableTalentCard:
    result?.enableTalentCard, externalPredictionReceive:
    result?.externalPredictionReceive, internalPredictionReceive:
    result?.internalPredictionReceive, profileReceive:
    result?.profileReceive\]\
    \
    *def* isValid = isValidTalentCardRecipient(catalogDetailProperties,
    result?.assessmentPurpose)\
    isValid == *true\
    *}.collect{ result -\> \[ resultId: result?.resultId , firstName:
    result?.firstName, lastName: result?.lastName, email:
    result?.email\]}

    -   Get MAP index using keys hashmaps do not have an order

        -   Object\[\] keys = map.keySet().toArray();

        -   map.get(keys\[i\]);

-   Multiput

-   LinkedHashMap.metaClass.multiPut \<\< { key, value -\>

-   delegate\[key\] = delegate\[key\] ?: \[\]; delegate\[key\] += value

-   }

-   

-   def myMap = \[:\]

-   

-   myMap.multiPut(\"a\", \"1\")

-   myMap.multiPut(\"a\", \"2\")

-   myMap.multiPut(\"a\", \"3\")

-   

-   myMap.each {key, list -\>

-   println \"\${key} -\> \$value.list(\",\")

-   }

    -   

-   Closure

    -   Def foo = { x -\> println x}

    -   C.parameterTypes

    -   List.eachWithIndex{ num, indx -\> println "\$indx : \$num"

    -   Lst.with { add(3) add(4) }

        -   When we invoke the with() method, it sets the closure's
            delegate property to the object on which with() is called

-   Tenary

    -   def location = (user.city == null) ? user.state : user.city

        -   def location = user.city ?: user.state

        -   !(userInstance?.hasCustomIDP(userInstance?.clientSetupId)
            \|\| userInstance.emailVerified )

            -   Used as a ternary if one needs to be true

```{=html}
<!-- -->
```
-   The Groovy spread operator \* (asterisk)

    -   def listAll = \[\*list0ne, \*listTwo\]

    -   def hashCodes = strings\*.hashCode()

-   Groovy Lazy Strings with closure

    -   quote = \"Today \${-\> company } stock closed at \${-\> price
        }\"

> stocks.each { key, value -\> company = key price = value println
> quote}

-   Math

    -   Ceil() rounds to nearest whole number 1.4 to 2, -1.4 to -1

    -   Max(2, 3) returns the max of the 2 arguments, returns 2

## **[Creating and Formatting Dates]**

### **[USE java LocalDate]**

<https://www.javatpoint.com/java-localdate>

Groovy Time

<http://docs.groovy-lang.org/latest/html/api/groovy/time/TimeCategory.html>

use( TimeCategory ) {\
endDate = duration ? (endDate + duration.minutes) : (endDate +
*DEFAULTDURATION*.minutes)\
}

<https://docs.oracle.com/javase/8/docs/api/java/time/format/DateTimeFormatter.html>

def form = DateTimeFormatter.*ofPattern*(\"yyyy/MM/dd\")\
println LocalDate.*parse*(\"2020/12/07\", form)\
\
form = DateTimeFormatter.*ISO_LOCAL_DATE\
*println LocalDate.*now*().format(form)

java date to localdatetime

Date theDate = Date.*parse*(\"yyyy/MM/dd hh:mm a\", \"2020/04/16 07:35
am\")\
\
\
LocalDateTime newDate =
theDate.toInstant().atZone(ZoneId.*systemDefault*()).toLocalDateTime()\
\
println LocalDateTime.*now*().truncatedTo(ChronoUnit.*MINUTES*)\
println newDate\
\
println
newDate.isBefore(LocalDateTime.*now*().truncatedTo(ChronoUnit.*MINUTES*))

-   Date scheduledDate = Date.*parse***(**userDateFormat + \'hh:mm a\',
    \"\$**{**schedulingParams?.scheduledDate**}**
    \$**{**schedulingParams?.scheduledTime**}**\"**)\
    **Date utcDate = new Date**(**scheduledDate.format**(**\'yyyy/MM/dd
    HH:mm:ss\', TimeZone.*getTimeZone***(**\"UTC\"**)))**

-   HH for 24 hour

-   a is for am/pm

-   add :ss for seconds

-   use .format to change date

-   USING Calendar

-   ![](/Users/bpaxton/IdeaProjects/tbcore/media/image2.png){width="5.40625in"
    height="1.5625in"}

-   Using Java8 Instant

    -   Instant nowUtc = Instant.*now***()**;\
        ZoneId asiaSingapore = ZoneId.*of***(**\"Asia/Singapore\"**)**;\
        \
        ZonedDateTime nowAsiaSingapore =
        ZonedDateTime.*ofInstant***(**nowUtc, asiaSingapore**)**;

    -   

**[Object Extensions]**

-   peter.invokeMethod("walk", 10)

    -   if you don't know the name of method at runtime

**[MetaProgramming]{.underline}**

-   obj\[usrRequestedProperty\], obj."\$usrRequestedProperty"

    -   to invoke a property dynamically

-   obj.properties.each {}

    -   iterate over an objects properties

-   object.hasProperty(methodName)

    -   check if property exists

-   

-   object.methods.each{}

    -   iterate through objects methods

-   test.metaClass.methods.each{ method -\> if (method.name ==
    'thismethod') method.invoke(arg)}

    -   iterate through methods

-   object.respondsTo(methodName)

    -   check if method exists

**[JSON]{.underline}**

-   ​new​ groovy.json.JsonBuilder(john)

    -   Will take object and turn it into json

-   Def bldr = new​ groovy.json.JsonBuilder(john) bldr {firstName
    john.first lastName john.last}

    -   Set customized output

-   StreamingJsonBuilder

    -   Instead of storing it in memory, if we want to directly stream
        the data as it's created

-   ​**def**​ sluper = ​**new**​ JsonSlurper() def output =
    sluper.parse(jsonObject)

    -   which returns an instance of HashMap with the data

**[Enums]{.underline}**

-   Custom check enums

    -   AssessmentPurpose.getEnumConstants().find{it.key.equalsIgnoreCase("extrn")}?.value

-   **[GET By value]{.underline}**

    -   FitStatement.getEnumConstants().find{ (it.value ==
        member.result) }?.match ?: member.result

    -   

-   Using a static list in an enum

    -   static def *dontDelete* = EnumSet.*of*(TYPE1, TYPE2, TYPE3)

    -   boolean isUnDeletableType()\
        {\
        return *unDeletableType*.contains(this) ;\
        }

```{=html}
<!-- -->
```
-   **[HTTPBuilder]{.underline}**

-   get file-

-   

def getAttachments(documentObject, authToken) {\
def uri =
StringUtils.*replaceEach*(*config*.externalResource.documents.documentDownloadUrlURI,\
\[\'@@clientSetupId@@\', \"@@documentId@@\"\] as String\[\],\
\[\"\${documentObject?.clientSetupId}\",\"\${documentObject?.id}\"\] as
String\[\])\
\
def httpResponse = awsDocumentHTTPBuilder(authToken, uri)\
if (httpResponse?.pass) {\
*log*.debug(\"retrieved download url for
\${documentObject?.originalFileName}\")\
return \[name: \"\${documentObject?.originalFileName}\", downloadUrl:
httpResponse?.jsonData?.downloadUrl\]\
}\
else {\
*log*.debug \"Failed to get download url for
\${documentObject?.originalFileName}\"\
*log*.error \"\${httpResponse?.response?.statusLine}\"\
*log*.debug \"Response json: \${httpResponse?.jsonData}\"\
def headersString\
httpResponse?.response?.headers?.each {\
headersString += \"\${it.name} : \${it.value}\"\
}\
*log*.error \"HTTP Response Headers \${headersString}\"\
return null\
}\
}\
\
def awsDocumentHTTPBuilder(authToken, uriString, def uriParameterMap =
null) {\
def result = \[pass: false, response: \'\', jsonData: \'\'\]\
def target = *config*.externalResource.documents.url\
def builder = new HTTPBuilder(target)\
CoreUtils.*acceptUnsecureCert*(builder)\
\
builder.request(Method.*GET*) {\
headers\[\'Authorization\'\] = \"Bearer \${authToken}\"\
requestContentType = ContentType.*ANY\
*headers.Accept = \'application/octet-stream, application/json,
text/plain, \*/\*\'\
uri.path = uriString\
uri.query = uriParameterMap\
*log*.info \"Sending documents request to uri:\${builder?.uri}, path:
\${uriString}, queryparams: \${uriParameterMap}\"\
response.success = { resp, json -\>\
*log*.info \"Documents Response status from API call :
\${resp.responseBase} \"\
result.pass = true\
result.response = resp\
result.jsonData = json\
}\
response.failure = { resp, json -\>\
result.pass = false\
result.response = resp\
result.jsonData = json\
*log*.error \"Failed in awsDocumentHTTPBuilder to fetch documents
\${resp?.responseBase}\"\
}\
}\
\
return result\
}

-   

def getAttachments(attachments, uniqueTempDirName){\
*//max size for sending with PostMark 4MB\
*def maxAttachmentsSize = 4194304\
def totalAttachmentSize = 0\
def attachmentList = \[\]\
\
try {\
def tempDir = new File(\"\$uniqueTempDirName\")\
tempDir.mkdir()\
\
*log*.info(\"temp sub dir created for attachments \$uniqueTempDirName,
Current Path \${tempDir?.absolutePath}\")\
\
attachments.each {\
*log*.debug(\"getting and encoding file for attachment \${it.name}\")\
File file = new File(\"\${uniqueTempDirName}/\${it.name}\")\
FileOutputStream fos = new FileOutputStream(file)\
fos.write(new URL(it.downloadUrl).getBytes())\
fos.close()\
\
if(file.size() + totalAttachmentSize \<= maxAttachmentsSize){\
def encodedFile = file.bytes.encodeBase64().toString()\
attachmentList \<\< \[Name: \"\${it.name}\", Content: encodedFile,
ContentType: \'application/octet-stream\'\]\
totalAttachmentSize += file.size()\
}\
\
file.delete()\
return true\
}\
\
tempDir.delete()\
}\
catch (def e) {\
*log*.error(\"error creating/ encoding file for attachment\", e)\
}\
\
return attachmentList\
}

-   

![](/Users/bpaxton/IdeaProjects/tbcore/media/image3.png){width="6.5in"
height="4.2027777777777775in"}