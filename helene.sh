# vim: filetype=i3
# File originally by Luke Smith <https://lukesmith.xyz>

# This config file will use environmental variables such as $BROWSER and $TERMINAL.
# You can set these variables in ~/.profile or ~/.bash_profile if you have it as below:
#
# export FILE="ranger"
# export TERMINAL="st"

# #---Basic Definitions---# #
for_window [class="^.*"] border pixel 2
gaps inner 15
gaps outer 15
set $term --no-startup-id $TERMINAL
set $mod Mod4

# #---Dropdown Windows---# #
# General dropdown window traits. The order can matter.
for_window [instance="dropdown_*"] floating enable
for_window [instance="dropdown_*"] move scratchpad
for_window [instance="dropdown_*"] sticky enable
for_window [instance="dropdown_*"] scratchpad show
for_window [instance="dropdown_tmuxdd"] resize set 625 450
for_window [instance="dropdown_dropdowncalc"] resize set 800 300
for_window [instance="dropdown_tmuxdd"] border pixel 3
for_window [instance="dropdown_dropdowncalc"] border pixel 2
for_window [instance="dropdown_*"] move position center

bar {
	font pango:mono 10
	status_command i3blocks
	position top
	mode dock
	modifier None
}

# #---Basic Bindings---# #
bindsym $mod+Shift+Return	exec --no-startup-id samedir

bindsym $mod+Shift+space 	floating toggle
bindsym $mod+space		focus mode_toggle

bindsym $mod+Escape		workspace prev
bindsym $mod+Shift+Escape 	exec --no-startup-id prompt "Exit i3?" "i3-msg exit"

#STOP/HIDE EVERYTHING:
bindsym $mod+Shift+Delete	exec --no-startup-id lmc truemute ; exec --no-startup-id lmc pause ; exec --no-startup-id pauseallmpv; workspace 0; exec $term -e htop ; exec $term -e $FILE

# #---Letter Key Bindings---# #
bindsym $mod+q			[con_id="__focused__" instance="^(?!dropdown_).*$"] kill
bindsym $mod+Shift+q		[con_id="__focused__" instance="^(?!dropdown_).*$"] exec --no-startup-id kill -9 `xdotool getwindowfocus getwindowpid`

bindsym $mod+Shift+r		exec --no-startup-id winresize

bindsym $mod+t			split toggle
bindsym $mod+Shift+t		gaps inner current set 15; gaps outer current set 15

bindsym $mod+Shift+y		exec --no-startup-id i3resize left

bindsym $mod+u			exec --no-startup-id ddspawn tmuxdd
bindsym $mod+Shift+u		exec --no-startup-id i3resize down

bindsym $mod+Shift+i		exec --no-startup-id i3resize up

bindsym $mod+o			sticky toggle
bindsym $mod+Shift+o		exec --no-startup-id i3resize right

bindsym $mod+a			exec --no-startup-id ddspawn dropdowncalc -f mono:pixelsize=24

bindsym $mod+s			gaps inner current plus 5
bindsym $mod+Shift+s		gaps inner current minus 5

bindsym $mod+Shift+d		gaps inner current set 0; gaps outer current set 0

set $freeze Distraction-free mode (super+shift+f to reactivate bindings)
mode "$freeze" { bindsym $mod+Shift+f mode "default"
}

bindsym $mod+f			fullscreen toggle
bindsym $mod+Shift+f		mode "$freeze" ;; exec --no-startup-id notify-send "Distraction-free mode activated." "Press Super+Shift+f to return."

bindsym $mod+g			workspace prev

bindsym $mod+h			focus left
bindsym $mod+Shift+h		move left 30
bindsym $mod+Ctrl+h		move workspace to output left

bindsym $mod+j			focus down
bindsym $mod+Shift+j		move down 30
bindsym $mod+Ctrl+j		move workspace to output down

bindsym $mod+k			focus up
bindsym $mod+Shift+k		move up 30
bindsym $mod+Ctrl+k		move workspace to output up

bindsym $mod+l			focus right
bindsym $mod+Shift+l		move right 30
bindsym $mod+Ctrl+l		move workspace to output right

bindsym $mod+z			gaps outer current plus 5
bindsym $mod+Shift+z		gaps outer current minus 5

bindsym $mod+c			exec --no-startup-id cabl

bindsym $mod+v			exec --no-startup-id $term -e $EDITOR -c "VimwikiIndex"

bindsym $mod+b			bar mode toggle
bindsym $mod+Shift+b		floating toggle; sticky toggle; exec --no-startup-id hover left

bindsym $mod+Shift+n		floating toggle; sticky toggle; exec --no-startup-id hover right

# #---Workspace Bindings---# #
bindsym $mod+Home		workspace $ws1
bindsym $mod+Shift+Home		move container to workspace $ws1
bindsym $mod+End		workspace $ws10
bindsym $mod+Shift+End		move container to workspace $ws10
bindsym $mod+Prior		workspace prev
bindsym $mod+Shift+Prior	move container o workspace prev
bindsym $mod+Next		workspace next
bindsym $mod+Shift+Next		move container to workspace next
bindsym $mod+Tab		workspace back_and_forth
bindsym $mod+XF86Back		workspace prev
bindsym $mod+Shift+XF86Back	move container to workspace prev
bindsym $mod+XF86Forward	workspace next
bindsym $mod+Shift+XF86Forward	move container to workspace next
bindsym $mod+semicolon		workspace next
bindsym $mod+apostrophe		split horizontal ;; exec $term
bindsym $mod+slash		split vertical ;; exec $term
bindsym $mod+Shift+slash	kill
bindsym $mod+backslash		workspace back_and_forth

set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"

# switch to workspace
bindsym $mod+1		workspace $ws1
bindsym $mod+2		workspace $ws2
bindsym $mod+3		workspace $ws3
bindsym $mod+4		workspace $ws4
bindsym $mod+5		workspace $ws5
bindsym $mod+6		workspace $ws6
bindsym $mod+7		workspace $ws7
bindsym $mod+8		workspace $ws8
bindsym $mod+9		workspace $ws9
bindsym $mod+0		workspace $ws10

# move focused container to workspace
bindsym $mod+Shift+1	move container to workspace $ws1
bindsym $mod+Shift+2	move container to workspace $ws2
bindsym $mod+Shift+3	move container to workspace $ws3
bindsym $mod+Shift+4	move container to workspace $ws4
bindsym $mod+Shift+5	move container to workspace $ws5
bindsym $mod+Shift+6	move container to workspace $ws6
bindsym $mod+Shift+7	move container to workspace $ws7
bindsym $mod+Shift+8	move container to workspace $ws8
bindsym $mod+Shift+9	move container to workspace $ws9
bindsym $mod+Shift+0	move container to workspace $ws10

for_window [class="Pinentry"] sticky enable
for_window [class="sent"] border pixel 0px
for_window [title="GIMP Startup"] move workspace $ws5
for_window [class="Gimp"] move workspace $ws5
for_window [window_role="GtkFileChooserDialog"] resize set 800 600
for_window [window_role="GtkFileChooserDialog"] move position center
for_window [title="Default - Wine desktop"] floating enable

# Bindings to make the webcam float and stick.
for_window [title="mpvfloat"] floating enable
for_window [title="mpvfloat"] sticky enable
for_window [title="mpvfloat"] border pixel 0
no_focus [title="mpvfloat"]

# #---Function Buttons---# #
bindsym $mod+F2		restart

# #---Arrow Keys---# #
bindsym $mod+Left		focus left
bindsym $mod+Ctrl+Left		move workspace to output left
bindsym $mod+Down		focus down
bindsym $mod+Ctrl+Down		move workspace to output down
bindsym $mod+Up			focus up
bindsym $mod+Ctrl+Up		move workspace to output up
bindsym $mod+Right 		focus right
bindsym $mod+Ctrl+Right		move workspace to output right
bindsym $mod+Shift+Left		move left
bindsym $mod+Shift+Down		move down
bindsym $mod+Shift+Up		move up
bindsym $mod+Shift+Right 	move rightt
