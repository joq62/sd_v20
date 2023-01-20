%%% @author c50 <joq62@c50>
%%% @copyright (C) 2023, c50
%%% @doc
%%%
%%% @end
%%% Created : 20 Jan 2023 by c50 <joq62@c50>

-module(sd).


%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------


%% --------------------------------------------------------------------
-define(SERVER,sd_server).


%% External exports
-export([
	 get_node/1,
	 get_node_on_node/2,
	 get_node_on_host/2,
	 get_node_host/1,
	 get_node_host_on_node/2,
	 get_node_host_on_host/2,
	 call/5,
	 cast/4,
	 all/0,


	 ping/0
	]).

-export([
	 start/0,
	 stop/0
	]).

%%--------------------------------------------------------------------
%% @doc
%% @spec
%% @end
%%--------------------------------------------------------------------
start()-> gen_server:start_link({local, ?SERVER}, ?SERVER, [], []).
stop()-> gen_server:call(?SERVER, {stop},infinity).

%%--------------------------------------------------------------------
%% @doc
%% @spec
%% @end
%%--------------------------------------------------------------------


all()->
    sd_server:all().
get_node(WantedApp)->
    sd_server:get_node(WantedApp).
get_node_on_node(WantedApp,WantedNode)->
    sd_server:get_node_on_node(WantedApp,WantedNode).
get_node_on_host(WantedApp,WantedHost)->
    sd_server:get_node_on_host(WantedApp,WantedHost).
get_node_host(WantedApp)->
    sd_server:get_node_host(WantedApp).
get_node_host_on_node(WantedApp,WantedNode)->
    sd_server:get_node_host_on_node(WantedApp,WantedNode).
get_node_host_on_host(WantedApp,WantedHost)->
    sd_server:get_node_host_on_host(WantedApp,WantedHost).


call(App,M,F,A,T)->
    sd_server:call(App,M,F,A,T).



cast(App,M,F,A)->
    sd_server:cast(App,M,F,A).



%% 
%% @doc:check if service is running
%% @param: non
%% @returns:{pong,node,module}|{badrpc,Reason}
%%
-spec ping()-> {atom(),node(),module()}|{atom(),term()}.
ping()-> 
    gen_server:call(?SERVER, {ping},infinity).

