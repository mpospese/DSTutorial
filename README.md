# DSTutorial
Repo to accompany my half-day tutorial "Engineering Design Systems"

> Many companies are coming to realize the many benefits that design systems bring. A good design system (and its accompanying set of engineered components) can improve design quality and consistency and provide significant reduction in production times for both design and development teams. But how do you engineer the components depicted in the design system? In this talk we will learn how to consume design files and then engineer our own mini design system beginning with the foundations of color, spacing, and typography. We will use our foundations to create a few simple elements, and then we will assemble those into a card component, form fields, and finally a form. Along the way we will consider accessibility through the lens of dark mode, increased color contrast, landscape support, Dynamic Type, and bold text support.

We will be implementing (and expanding upon) a very small set of features from Uber's [Base Design System](https://www.figma.com/file/eit8RZXY7SDkYDYJIHGIi3/%E2%9D%96-Base-Gallery-(Community)).

Our minimum set of functionality will require the following elements:
(items marked "stretch" will be covered time-permitting but will be in the final version of the project regardless)

## I. Foundations
    ### A. Colors
        1. backgroundPrimary
        2. backgroundTertiary
        3. contentPrimary
        4. contentTertiary
        5. borderOpaque
        6. borderSelected
        7. backgroundStateDisabled
        8. contentStateDisabled
    ### B. Spacing (these semantic values are not part of Base)
        1. small
        2. mediumSmall
        3. medium
        4. mediumLarge
    ### C. Images
        1. medal
        2. banner (cow image, not part of Base)
    ### D. Typography
        1. Heading
            a) Small
        2. Label
            a) Medium
            b) Small (stretch)
            c) Large (stretch)
        3. Paragraph
            a) Small
            b) Medium
            c) Large (stretch)
    ### E. Breakpoints (stretch)
        1. small
        2. medium
        3. large

## II. Elements
    ### A. Button (Rect, Secondary) = Color + Typography + Spacing
        1. default (Medium)
        2. sized (stretch)
            a) Small
            b) Medium
            c) Large
        3. breakpoint / autosizing (stretch)
    ### B. Input (Simple) = Color + Typography + Spacing
        1. default (Medium)
        2. sized (stretch)
            a) Small
            b) Medium
            c) Large
        3. breakpoint / autosizing (stretch)
    ### C. Text = Color + Typography
        1. Heading
            a) default (Small)
        2. Label
            a) default (Medium)
            b) sized (stretch)
                (1) Small
                (2) Medium
                (3) Large
            c) breakpoint / autosizing (stretch)
        3. Paragraph
            a) default (Medium)
            b) sized (stretch)
                (1) Small
                (2) Medium
                (3) Large
            c) breakpoint / autosizing (stretch)
            
## III. Components
    ### A. CardView = Image + Heading + Paragraph + Button
    ### B. FormField = Label + Input + Paragraph
    
## IV. Modules
    ### A. FormView = FormField + Button
            
## Steps

### 0.
* Swift Package: DSKit
    * Depends on two open source frameworks (also Swift Packages)
        * YCoreUI: AutoLayout helpers, color contrast testing, scroll view assistance
        * YMatterType: Typography support for buttons, labels, text fields, and text views
    * Assets: colors, fonts, images
    * Enum for loading colors from Asset catalog (we will not use)
    * Color primitives from Uber Base
    * Helper classes for unit tests
    * Unit tests for checking foreground / background color contrast
* Empty app with tab bar and 2 empty view controllers: card & form, which will house Component III. A. CardView and Module IV. A. FormView

### 1.
* Define Colors
* Unit test WCAG 2.0 contrast for more color pairings (test failure)
* Use new DSKit framework colors in DSTutorial app

### 2.
* Add high contrast colors for primaryA & primaryB

### 3.
* Add enum to load images from Asset catalog
* Unit tests to confirm image load

### 4.
* Add Spacing
* Unit tests

### 5.
* Add register/unregister fonts to DSKit
* Unit tests
* Register fonts in app

### 6.
* Add Typography.Heading
* XCTestCase subclass to register/unregister fonts on setUp/tearDown
* Unit tests

### 7.
* Add Typography.Label.Medium
* Unit tests

### 8.
* Add Typography.Paragraph.Medium & Small
* Unit tests

### 9.
* Add Text/Heading Element
* Expand XCTestCase subclass with helpers for comparing typography & color
* Unit tests

### 10.
* Add Text/Label Element
* Unit tests

### 11.
* Add Text/Paragraph Element
* Unit tests

### 12.
* Add Button Element
* Unit tests

### 13.
* Assemble CardView Component
* Unit tests
* Add CardView to app

### 14.
* Add Input Element
* Unit tests

### 15.
* Assemble FormField Component
* Unit tests

### 16.
* Assemble FormView Module
* Unit tests
* Add FormView to app

### 17.
* Add increased contrast colors for backgroundTertiary / contentTertiary 

## Stretch - let's add Breakpoints!

### 1.
* Add Typography.Label.Large & Small
* Add Typography.Paragraph.Large
* Unit tests

### 2.
* Add Foundation Breakpoint
* Unit tests

### 3.
* Add breakpoint support to Tyopgraphy.Label & Paragraph

### 4. Advanced unit testing
* Add stubs to be able to change current Breakpoint
* Unit tests for Typography+Breakpoint

### 5.
* Add Large/Medium/Small variants of Text/Label & Text/Paragraph
* Unit tests
