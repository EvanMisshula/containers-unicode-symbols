{-# LANGUAGE NoImplicitPrelude, UnicodeSyntax #-}

{-|
Module     : Data.Map.Strict.Unicode
Copyright  : 2009–2012 Roel van Dijk
License    : BSD3 (see the file LICENSE)
Maintainer : Roel van Dijk <vandijk.roel@gmail.com>
-}

module Data.Map.Strict.Unicode
    ( (∈), (∋), (∉), (∌)
    , (∅)
    , (∪), (∖), (∆), (∩)
    ) where


-------------------------------------------------------------------------------
-- Imports
-------------------------------------------------------------------------------

-- from base:
import Data.Bool     ( Bool )
import Data.Ord      ( Ord )
import Data.Function ( flip )

-- from containers:
import Data.Map.Strict ( Map
                       , member, notMember
                       , empty
                       , union, difference, intersection
                       )


-------------------------------------------------------------------------------
-- Fixities
-------------------------------------------------------------------------------

infix  4 ∈
infix  4 ∋
infix  4 ∉
infix  4 ∌
infixl 6 ∪
infixr 6 ∩
infixl 9 ∖
infixl 9 ∆


-------------------------------------------------------------------------------
-- Symbols
-------------------------------------------------------------------------------

{-|
(&#x2208;) = 'member'

U+2208, ELEMENT OF
-}
(∈) ∷ Ord k ⇒ k → Map k α → Bool
(∈) = member
{-# INLINE (∈) #-}

{-|
(&#x220B;) = 'flip' (&#x2208;)

U+220B, CONTAINS AS MEMBER
-}
(∋) ∷ Ord k ⇒ Map k α → k → Bool
(∋) = flip (∈)
{-# INLINE (∋) #-}

{-|
(&#x2209;) = 'notMember'

U+2209, NOT AN ELEMENT OF
-}
(∉) ∷ Ord k ⇒ k → Map k α → Bool
(∉) = notMember
{-# INLINE (∉) #-}

{-|
(&#x220C;) = 'flip' (&#x2209;)

U+220C, DOES NOT CONTAIN AS MEMBER
-}
(∌) ∷ Ord k ⇒ Map k α → k → Bool
(∌) = flip (∉)
{-# INLINE (∌) #-}

{-|
(&#x2205;) = 'empty'

U+2205, EMPTY SET
-}
(∅) ∷ Map k α
(∅) = empty
{-# INLINE (∅) #-}

{-|
(&#x222A;) = 'union'

U+222A, UNION
-}
(∪) ∷ Ord k ⇒ Map k α → Map k α → Map k α
(∪) = union
{-# INLINE (∪) #-}

{-|
(&#x2216;) = 'difference'

U+2216, SET MINUS
-}
(∖) ∷ Ord k ⇒ Map k α → Map k β → Map k α
(∖) = difference
{-# INLINE (∖) #-}

{-|
Symmetric difference

a &#x2206; b = (a &#x2216; b) &#x222A; (b &#x2216; a)

U+2206, INCREMENT
-}
(∆) ∷ Ord k ⇒ Map k α → Map k α → Map k α
a ∆ b = (a ∖ b) ∪ (b ∖ a)
{-# INLINE (∆) #-}

{-|
(&#x2229;) = 'intersection'

U+2229, INTERSECTION
-}
(∩) ∷ Ord k ⇒ Map k α → Map k β → Map k α
(∩) = intersection
{-# INLINE (∩) #-}
