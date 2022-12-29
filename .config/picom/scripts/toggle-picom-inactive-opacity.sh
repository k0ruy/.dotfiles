# Data.
NO_DIM="inactive-opacity = 1.00;"
DIM="inactive-opacity = 0.85;"
FILENAME="/home/alex/.config/picom/picom.conf"

# Check dim state.
if grep -Fxq "$DIM" $FILENAME

# Currently dim.
then
    sed -i "s/$DIM/$NO_DIM/g" $FILENAME

# Currently no dim.
else
    sed -i "s/$NO_DIM/$DIM/g" $FILENAME
fi
