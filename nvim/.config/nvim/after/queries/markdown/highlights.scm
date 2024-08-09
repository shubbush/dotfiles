;; extends

; Headings
[(atx_h1_marker) (atx_h2_marker) (atx_h3_marker) (atx_h4_marker) (atx_h5_marker)] @MdHeaderMarker
(atx_heading heading_content: (inline) @MdHeaderContent)

; List item markers
(list (list_item [(list_marker_dot) (list_marker_minus) (list_marker_star) (list_marker_plus)] @MdListItemMarker)) 

; Block quote
(block_quote) @MdBlockQuote
(block_quote_marker) @MdBlockQuoteMarker

; Links
; (inline (inline_link (link_text) @MdLinkText))
