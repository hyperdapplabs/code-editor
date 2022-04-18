address(weth, '0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2').

prompt :-
  show [
    text('ETH <-> WETH'),
    row(
      col(
        text('ETH'),
        input(eth, eth),
        button('WRAP', { enabled: get(input/eth, _) }, [
          wrap_eth
        ])
      ),
      col(
        text('WETH'),
        input(eth, weth),
        button('UNWRAP', { enabled: get(input/weth, _) }, [
          unwrap_eth
        ])
      )
    )
  ].

wrap_eth :-
    get(input/eth, ETH),
    call_fn(weth, deposit, [value(eth(ETH))], []),
    text('You swapped ', ETH, ' for WETH successfully!').

unwrap_eth :-
    get(input/weth, WETH),
    call_fn(weth, withdraw(WETH), []),
    text('You swapped ', WETH, ' for ETH successfully!').

abi(weth, [
    name: string / view,
    approve(address, uint256): bool,
    totalSupply: uint256 / view,
    transferFrom(address, address, uint256): bool,
    withdraw(uint256),
    decimals: uint8 / view,
    balanceOf(address): uint256 / view,
    symbol: string / view,
    transfer(address, uint256): bool,
    deposit: payable,
    allowance(address, address): uint256 / view
]).
