crea@groovy.transform.ToString

Used for classes to establish to string

# Strings

‘’’ …  ‘’’ three single quotes creates a multiline string obj

Str -=  “rainy”      will remove rainy from the string

Use stripIndent() or stripMargin() remove indents

stripMargin(‘char’) indicates what lines, or | by default

"""<p><strong>Scheduled Interview Summary</strong></p>
       |<p><strong>Company</strong>: @@company@@<br>""".stripMargin()

 

"abc".tr('abc', '321')

## Replace characters in string

Java char saved as int per ascii

Def x = ‘a’ 

(int)x -96  = 1

## Splitting strings

The split() method returns a string [] instance and the  tokenize() method returns a list instance

 tokenize() ,which returns a list, will ignore empty string (when a delimiter appears twice in  succession) where as split() keeps such string.

## Slice   word[0..3]

Will get letters at index 0 through 3

word[1,6,0] get letters index 1,6, and 0