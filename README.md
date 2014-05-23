anagram
=======

Find anagrams of input that are also dictionary words

Usage:
>> ruby anagrams.rb winteriscoming
win
in
is
...

Suppose the size of the input is N and the size of the word list is c. c is a constant. One way
to solve this is to enumerate all anagrams of the input, then check each one to see if it's in the word list.
There are more than 2^N anagrams of the input. 

To see why, note that if the letters of the input are unique,
there are 2^N subsets of the set of the letters of the input. Each one of these sets, taken in a particular
order, is a word. But the subsets that have k letters can be arranged in k! ways, so there are more than
just 2^N anagrams to consider.

For each anagram, we could binary search the wordlist, resulting in a runtime of O(2^N * log(c)) = O(2^N).

This approach gets pretty bad for any decent-sized N. For perspective, the word list I used is about 150k words,
but if 2^20 is already > 1 million.

Instead, I scan the wordlist into a hash where the key is sorted list of letters. For example, one entry
might be

```
  {"int" => ["tin", nit"]}
```

Note that each value is a list, because there might be multiple words that correspond to
a particular key. 

Next, I go through the keys of the wordlist, and check if each key is a subword of the input, which happens
when all the letters of key are present in the input. 

The asymptotic runtime of this approach is O(N). I do O(c) work for the initial scan, then O(c) work
to go through the keys. Looking at each key could take up to O(N) time, so this part takes O(cN) = O(N) 

