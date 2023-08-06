# Array

Int [] arr = [1, 2, 3]

# To loop

_**20.times {print}**_

_**1.upto(10) {num -> println}**_

_**10.downto(1)**_

_**0.step(1, 0.1)**_

# List

_**Def list = [1,2,3,..]**_

List.size

List <<

_**List.push  **_  adds item

List.putat(0, )

List[1] = 77

List. Removeat

Remove(1) removes at index 1,  Remove(“c”) removes element with that value

List.removeAll{it == 2}

Better remove all removes list from list also list.removeall(list2)

userAuthList -= grantedAuthListToRemove

 

List.minus

List –[object]

List.pop    remove last item

List. Getat (0..3)     range

List.clear

For(x in list){print x}

List.flatten for lists in lists

_**The result is a flattened single List of objects:**_  from [[1,2], 1, 2]  to [1,2,1,2]

List.unique

List.each {print it}

arr.withIndex().findIndexOf {element, index -> isEven(element)}

_**creates list of tuples**_ [[element, index] , [element, index]]

_**creates map**_
arr.indexed().findIndexOf { e -> fn(e.value, e.key) }

List.find { it == 2}

List.findAll {it >= 2}

user.dam  = damList.find {it.userId == user.id }.damName

Finding and getting a specific value

List.join(‘  ‘)

join() _**iterates over each element, concatenating every element with the character given as the input parameter.**_

 

 list[-1]

_**Using negative numbers starts on the right, this will get the last number**_

 

list.reverseEach {}

runs list in reverse closuer

list.eachWithIndex{}

list.reverse(true)

returns list in reverse in place

_**The collect() method, like each(), invokes the closure for each element of the**_
_**collection. However, it collects the return value from the closure into a collection and finally returns that resulting collection**_
list.collect{it*2}

Mylist.sum()

_**Will drop first 3 elements, does not change array**_
List.drop(3)

_**Returns boolean**_
_**Modifies this collection so that it retains only its elements that are matched according to the specified closure condition. In other words, removes from this collection all of its elements that don't match.**_
List.retainAll{}

_**Opposite of retain**_
List.removeAll{}
 

Mylist.inject {variable, element -> variable + element.size()}

_**// With the inject method we 'inject' the**_

_**// first value of the result, and then for**_

_**// each item the result is increased and**_

_**// returned for the next iteration.**_

def sum = (1..4).inject(0) { result, i -> result + i }

assert 10 == sum

_**Merges two lists**_
_**Modifies in place**_
Mylist.addall(secondlist)  
 
_**Gets similar elements**_
Mylist.intersect

_**Tests if there are common elements, if not returns true**_
Mylist.disjoint

_**Checks if any element meets condition return Boolean**_
list.any()

_**checks if every element meets condition returns Boolean**_
_**fyi - groovy every closure will return true if empty list, even though condition is not met**_
list.every() 

_**use condition and mutate return**_
println Employee.list().findResults{it.salary>25000?(firstName+' '+lastName):null}

_** transform items from a collection into a collection. The resulting collection is then flattened into a single collection**_
list.collectMany { [it, it.toUpperCase()] }

_**is a method on any Iterable to split or partition its elements into a sub-list of a certain size**_
List.collate(size)


_**The result is a map where the key is the grouping condition and the value contains the elements of the Collection type belonging to the key**_
list.groupBy{}

_**Groovy collectEntries iterates over a collection and return a Map based on the manipulations**_
_**Groovy collectEntries iterates over a collection and return a Map based on the manipulations**_
List.collectEntries{}



-example using groupBy and collectEntries

	savedUserResponses.groupBy{it.fitGuideType}.collectEntries {

         [it.key, it.value.collectEntries {[('Q'+ it.questionNumber.toString()): it.rating]}]

      }

 

_**-list of strings to long**_
sharedGroupIds?.collect{Long.valueOf(it)}

 

##  -paginate or split list substring(beginning index, ending index)

	### Paginate 

response.sort{it.groupName}.subList( Math.min( 5 as Integer, 21 ), Math.min( (5 as Integer) + (10 as Integer), 21 ) )

 

# Maps

Def map = [key : value]

Map.put(‘key’, ‘value’)

Map[‘yourKey’] = yourValue

Map.’yourKey’ = yourValue

Map << [yourKey : yourValue]

_**Create or add to map**_
_**To use a variable as key, put variable in ()**_

Map .values   print only values

Map.keySet()

Get list of keys

Map.’key’

Will get value

Map.find {key, value -> value.size() >3}

_**find and return value**_
mymap.find{ it.key == "likes" }?.value

Map.each {key, value ->    println “$key  and $value”

_**Checks if any element meets condition return Boolean**_
Map.any()



Map.every() checks if every element meets condition returns Boolean

Map.remove(‘key’) – removes object in place

Map.minus([key : value]) – removes map values

_**Returns the value to which the specified key is mapped, or defaultValue if this map contains no mapping for the key.**_
Map.getOrDefault()

params is a Map, so you can use params.containsKey(keyYourWanting):

map.subMap() method. Use list or range of keys to find from a map

### change a key in a map
  ` List<String> keys = new ArrayList<>(runMap.keySet())`

  ` keys.each {key ->`
 `     if(testMap.get(key)){`
         ` runMap.put("${testMap[key]}", runMap.remove(key))`
      ` }`
 `  }`

 

## HQL create map

         static List getGroupsByUser(Long userId, Long clientSetupId, def offset = 0, def max = 0, String orderBy = 'ug.name', String orderByDirection = 
                       'asc'){
              def query = """ 
              select new Map(ug.id as id, ug.name as name, ug.interviewModelId as interviewModelId,
              im.name as assessmentName,  im.sourceId as sourceId, im.source as source, im.subType as subType,
              ug.visibility as visibility, ugs.id is not null as shared , ug.lastUpdated as lastUpdated , COUNT(ugao.id) as assessmentCount) 
              from UserGroup ug  
              LEFT JOIN UserGroupAssessmentOrder ugao ON ug.id= ugao.userGroupId 
              LEFT JOIN ug.userGroupShare ugs ON ug.id = ugs.userGroupId and ugs.revoked = false
              LEFT JOIN InterviewModel im ON im.id = ug.interviewModelId
              where ug.userId = :userId and ug.type = :type and ug.clientSetupId = :clientSetupId
              GROUP BY ug.id
             order by @orderBy@ @orderByDirection@"""

            def modifiedQuery = query.replaceAll('@orderBy@', orderBy).replaceAll('@orderByDirection@', orderByDirection)

            findAll(modifiedQuery, [userId: userId, type: UserGroupType.RESULTGROUP, clientSetupId:
            clientSetupId], [offset: offset, max: max, cache: true])
            }

 

## Map with closure example

          shareResultsList = results.findAll{result ->
              def catalogDetailProperties = [enableTalentCard: result?.enableTalentCard, externalPredictionReceive: result?.externalPredictionReceive, 
             internalPredictionReceive: result?.internalPredictionReceive, profileReceive: result?.profileReceive]

              def isValid = isValidTalentCardRecipient(catalogDetailProperties, result?.assessmentPurpose)
              isValid == true
             }.collect{ result -> [ resultId: result?.resultId , firstName: result?.firstName, lastName: result?.lastName, email: result?.email]}

 

## Get MAP index using keys hashmaps do not have an order

Object[] keys = map.keySet().toArray();

map.get(keys[i]);

## Multiput

          LinkedHashMap.metaClass.multiPut << { key, value ->
           delegate[key] = delegate[key] ?: []; delegate[key] += value
                  }
 

          def myMap = [:]

        myMap.multiPut("a", "1")
        myMap.multiPut("a", "2")
        myMap.multiPut("a", "3")

        myMap.each {key, list ->
            println "${key} -> $value.list(",")
            }