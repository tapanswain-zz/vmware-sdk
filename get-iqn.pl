#!/usr/bin/perl -w
# Purpose :- To get  iqn number of Host from e vCenter & insert into database
use strict;
use warnings;
use POSIX;
use DBI;
use DBD::mysql;
use VMware::VILib;
use VMware::VIRuntime;

Opts::parse();
Opts::validate();
Util::connect();
my $vCenter = Opts::get_option('server');
my $host_views = Vim::find_entity_views(view_type => 'HostSystem');
        foreach my $host_view (@$host_views) {
                my $hostname = $host_view->{'name'};
                print "$hostname \n" ;
            if (defined($host_views)){
              if ($host_views ne 'ttsv-esxi-10.juniper.net'){
        my $storage = Vim::get_view(mo_ref => $host_view->configManager->storageSystem, properties => ['storageDeviceInfo']);
foreach my $dev (@{$storage->storageDeviceInfo->hostBusAdapter})

         {
                my $driver = $dev->status ;
                 #print "i am in \n" ;
                if   ($driver eq 'online' )
                 {
                 #my $iqn = $dev->iScsiName;
               if (exists($dev->{configuredSendTarget})){
                  my $str = $dev->configuredSendTarget;
                   my $iqn = $dev->iScsiName;
                   foreach my $str (@$str) {
                                my $nimble = $str->address ;

               print " $hostname  $nimble  \n " ;


}
}
}}}}}
Util::disconnect();



