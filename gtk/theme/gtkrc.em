# This gtkrc makes the assumption that:
#  2.25pt = 3px
#  3.5pt  = 4px

style "default"
{
    # Will be overriden in some widgets
    color["focus_line"] = "#FFFFFF"

    bg[NORMAL] = "#808080"
    bg[PRELIGHT] = "#808080"
    bg[ACTIVE] = "#ffffff"
    bg[SELECTED] = "#e7e7e7"

    fg[NORMAL]        = "#000000"
    fg[ACTIVE]        = "#000000"
    fg[SELECTED]      = "#ffffff"
    fg[PRELIGHT]      = "#ffffff"

    text[NORMAL] = "#000000" # "#7f7f7f" 1. need to patch GTK+ to use ACTIVE when focused, 2. what color should this really be?
    text[ACTIVE] = "#000000"
    text[SELECTED] = "#000000"
    text[PRELIGHT] = "#000000"

    base[NORMAL] = "#E6E6E6"
    base[ACTIVE] = "#ffffff"
    base[SELECTED] = "#a6a6a6"
    base[PRELIGHT] = "#ffffff"

    fg[INSENSITIVE] = "#808080"
    text[INSENSITIVE] = "#808080"

    xthickness = 3   # line_width
    ythickness = 3

    # A lot of these will probably need to be changed, but this has to
    # be done when the exact sizes are known
    GtkWidget::interior-focus = 0
    GtkWidget::focus-line-width = 1   # This does not do anything really
    GtkWidget::focus-padding = 0

    GtkWidget::wide-separators = 1
    GtkWidget::separator-height = 3 #line_width
    GtkWidget::separator-width = 3

    GtkRange::activate-slider = 1
    GtkButton::inner-border = { 6, 6, 6, 6 }           # ??

    GtkButton::default-border = { 1, 1, 1, 1 }         # line_width - focus-line-width
    GtkButton::default-outside-border = { 2, 2, 2, 2 } # focus-line-width

    GtkScrolledWindow::scrollbar-spacing = 0

    GtkCheckMenuItem::indicator-size = 20 # how to calculate this? and is it OK like this?
    GtkExpander::expander-size = 20       # same as indicator-size
    GtkExpander::expander-spacing = 2     # XXX

    GtkTreeView::expander-size = 20       # same as indicator-size

    engine "sugar" {
        # Is this correct? Should we make sure it is pixel aligned?
        # 6 pixel for the XO version, and 3 for the "normal" one
        line_width = 3.0
        # 9-10 pixel for the XO version, and 4 for the "normal" one
        thick_line_width = 4.0

        max_radius = 20.0
    }
}

style "window-content"
{
    color["bg_color"] = "#C0C0C0"

    bg[INSENSITIVE] = @bg_color
    base[INSENSITIVE] = @bg_color
}

style "window"
{
    color["bg_color"] = "#C0C0C0"

    bg[NORMAL] = @bg_color
}

style "scrollbar"
{
    GtkRange::slider-width = 10    # ?
    GtkRange::trough-border = 3    # line_width
    GtkRange::stepper-spacing = 0
    GtkScrollbar::min-slider-length = 30    # ?
    GtkScrollbar::has-forward-stepper = 0
    GtkScrollbar::has-backward-stepper = 0
    GtkScrollbar::has-secondary-forward-stepper = 0
    GtkScrollbar::has-secondary-backward-stepper = 0

    # Hack for mozilla as it does not obey the above style properties ...
    # Really, mozilla should be fixed ...
    GtkRange::stepper-size = 1

    engine "sugar" {
        hint = "scrollbar"
    }
}

style "scale"
{
    GtkWidget::focus-line-width = 0

    # "square" slider (really round of course)
    # Same as indicator-size?
    GtkRange::slider-width = 20
    GtkScale::slider-length = 20
    GtkRange::trough-border = 0
    GtkRange::stepper-spacing = 0
    GtkRange::trough-side-details = 1
}

# hints for the trough sizing hacks
style "hscale" = "scale"
{
    engine "sugar" {
        hint = "hscale"
    }
}

style "vscale" = "scale"
{
    engine "sugar" {
        hint = "vscale"
    }
}

style "spinbutton"
{
    engine "sugar" {
        hint = "spinbutton"
    }
}

style "comboboxentry"
{
    engine "sugar" {
        hint = "comboboxentry"
    }
}


style "frame"
{
    bg[NORMAL] = "#404040"
}

style "notebook"
{
    GtkNotebook::tab-overlap = -2
    
    xthickness = 0
    ythickness = 0
}

style "toolbox-notebook"
{
    bg[ACTIVE] = "#808080"
}

style "toolitem"
{
    color["focus_line"] = "#000000"

    bg[PRELIGHT] = "#000000"

    fg[PRELIGHT] = "#ffffff"
    fg[NORMAL]   = "#000000"

    engine "sugar" {
        max_radius = 5.0
    }
}

style "toolbox"
{
    GtkToolbar::shadow-type = GTK_SHADOW_NONE

    color["bg_color"] = "#404040"
    bg[NORMAL] = "#404040"
    fg[NORMAL] = "#FFFFFF"
    fg[ACTIVE] = "#FFFFFF"

    GtkButton::inner-border = { 6, 6, 6, 6 }
}

style "panel"
{
    bg[NORMAL] = "#C0C0C0"
    fg[NORMAL] = "#000000"
}

style "entry"
{
    # small inner border and a large x/ythickness for entries
    # to reduce the number of hacks needed :-)
    # This size needs to be choosen so the round corner work with the height
    # Something like (height / 2.0 - line_width) / sqrt(2), where height
    # is font height + x/ythickness
    xthickness = 7
    ythickness = 7

    GtkEntry::inner-border = { 0, 0, 0, 0 }

    GtkWidget::focus-line-width = 0
}

style "button"
{
    fg[NORMAL]        = "#ffffff"
}

style "checkbutton"
{
    fg[NORMAL]        = "#000000"
    fg[ACTIVE]        = "#000000"

    # I won't get the exact sizing, but this should be pretty close
    GtkCheckButton::indicator-size = 13
    GtkCheckButton::indicator-spacing = 3
    GtkWidget::focus-padding = 3
}

style "progressbar"
{
    xthickness = 0
    ythickness = 0

    # Make the bar visible (only until the engine implements it!)
    bg[PRELIGHT] = "#ffffff"
}

class "GtkWidget"      style "default"
class "GtkWindow"      style "window"
class "GtkEventBox"    style "window"
class "GtkNotebook"    style "notebook"
class "GtkEntry"       style "entry"
class "GtkSpinButton"  style "spinbutton"
class "GtkScrollbar"   style "scrollbar"
class "GtkHScale"      style "hscale"
class "GtkVScale"      style "vscale"
class "GtkProgressBar" style "progressbar"

widget_class "<GtkWindow>.*"      style "window-content"
widget_class "*<GtkComboBoxEntry>*" style "comboboxentry"
widget_class "*<GtkCombo>*" style "comboboxentry"
widget_class "*<SugarToolbox>*" style "toolbox"
widget_class "*<GtkToolItem>*" style "toolitem"
widget_class "*<SugarToolbox>*<GtkNotebook>" style "toolbox-notebook"
widget_class "*<GtkButton>*" style "button"
widget_class "*<GtkCheckButton>*" style "checkbutton"

widget_class "*<SugarPanel>" style "panel"

widget_class "*<SugarFrameWindow>*" style "frame"