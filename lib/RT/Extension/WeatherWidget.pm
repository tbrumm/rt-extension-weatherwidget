package RT::Extension::WeatherWidget;

our $VERSION = '1.00';

=head1 NAME

RT::Extension::WeatherWidget - Live weather dashboard widget for RT 6

=head1 DESCRIPTION

Displays current weather conditions on RT dashboards, derived from the
City / Zip / Country fields of the logged-in RT user's profile. Weather
data is fetched client-side from Open-Meteo (free, no API key required,
EU-hosted). Geocoding uses the Nominatim / OpenStreetMap API.

=head1 REQUIREMENTS

=over 4

=item * Request Tracker 5.0.0 or later (tested on RT 6)

=item * Each user must have City and/or Zip and Country filled in their
RT user profile (Admin → Users → <user> → General tab)

=item * Modern browser with Fetch API support

=item * Outbound HTTPS access from the browser to:
C<api.open-meteo.com>, C<geocoding-api.open-meteo.com>,
C<nominatim.openstreetmap.org>

=back

=head1 INSTALLATION

    perl Makefile.PL
    make
    sudo make install

Add to F</opt/rt6/etc/RT_SiteConfig.pm>:

    Plugin('RT::Extension::WeatherWidget');

Add C<WeatherWidget> to HomepageComponents:

    Set($HomepageComponents, [qw(WeatherWidget ...)]);

Optionally configure units (default: celsius):

    Set(%WeatherWidgetOptions,
        TemperatureUnit => 'celsius',   # or 'fahrenheit'
    );

Clear Mason cache and restart Apache:

    sudo systemctl stop apache2
    sudo rm -rf /opt/rt6/var/mason_data/obj/*
    sudo systemctl start apache2

=head1 AUTHOR

Torsten Brumm

=head1 LICENSE

GNU General Public License v2

=cut

1;
