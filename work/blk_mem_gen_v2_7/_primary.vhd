library verilog;
use verilog.vl_types.all;
entity blk_mem_gen_v2_7 is
    port(
        clka            : in     vl_logic;
        dina            : in     vl_logic_vector(15 downto 0);
        addra           : in     vl_logic_vector(15 downto 0);
        ena             : in     vl_logic;
        wea             : in     vl_logic_vector(0 downto 0);
        douta           : out    vl_logic_vector(15 downto 0);
        clkb            : in     vl_logic;
        dinb            : in     vl_logic_vector(15 downto 0);
        addrb           : in     vl_logic_vector(15 downto 0);
        enb             : in     vl_logic;
        web             : in     vl_logic_vector(0 downto 0);
        doutb           : out    vl_logic_vector(15 downto 0)
    );
end blk_mem_gen_v2_7;
